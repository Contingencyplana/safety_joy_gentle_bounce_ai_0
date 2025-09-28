# make_zips.ps1 — Build a "clean" text-first zip for Chat uploads
# Ctrl+Shift+B: creates {repo}_clean_latest.zip and rotates one timestamped backup.
# Keeps exactly TWO clean zips in dist/: *_clean_latest.zip + the newest *_clean_YYYY-MM-DD-HHmm.zip
param([switch]$Full)  # Optional: also build a full "assistant" zip when -Full is used

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$repoName = Split-Path $repoRoot -Leaf
$stamp    = Get-Date -Format "yyyy-MM-dd-HHmm"
$distDir  = Join-Path $repoRoot "dist"
New-Item -ItemType Directory -Force -Path $distDir | Out-Null

# --- Paths ---
$cleanLatest    = Join-Path $distDir ("{0}_clean_latest.zip"      -f $repoName)
$cleanStamped   = Join-Path $distDir ("{0}_clean_{1}.zip"         -f $repoName, $stamp)
$assistantZip   = Join-Path $distDir ("{0}_assistant_latest.zip"  -f $repoName)
$assistantStamp = Join-Path $distDir ("{0}_assistant_{1}.zip"     -f $repoName, $stamp)
$indexJson      = Join-Path $distDir "index.json"

# --- Helpers ---
function New-ZipSafe {
  [CmdletBinding()]
  param(
    [Parameter(Mandatory=$true)][string]$ZipPath,
    [Parameter(Mandatory=$true)][System.IO.FileInfo[]]$Files,
    [Parameter(Mandatory=$true)][string]$BaseDir
  )
  if (Test-Path $ZipPath) { Remove-Item $ZipPath -Force }
  Add-Type -AssemblyName System.IO.Compression.FileSystem
  $zip = [System.IO.Compression.ZipFile]::Open($ZipPath, [System.IO.Compression.ZipArchiveMode]::Create)
  foreach ($f in $Files) {
    $rel = [System.IO.Path]::GetRelativePath($BaseDir, $f.FullName) -replace '\\','/'
    [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile(
      $zip, $f.FullName, $rel, [System.IO.Compression.CompressionLevel]::Optimal
    ) | Out-Null
  }
  $zip.Dispose()
}

function Test-ZipReadable {
  param([string]$ZipPath)
  try {
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $zip = [System.IO.Compression.ZipFile]::OpenRead($ZipPath)
    $n = $zip.Entries.Count
    $sample = $zip.Entries | Select-Object -First ([Math]::Min(3, $n)) | ForEach-Object { $_.FullName }
    $zip.Dispose()
    return @{ ok = $true; count = $n; sample = $sample }
  } catch {
    return @{ ok = $false; error = $_.Exception.Message }
  }
}

function Hash([string]$Path) {
  if (-not (Test-Path $Path)) { return "" }
  (Get-FileHash -Algorithm SHA256 -Path $Path).Hash
}

# --- Collect files (exclude build/runtime/tooling dirs and OS junk) ---
$excludeRegex = '\\\.git\\|\\bdist\\b|\\bexports\\b|\\bjson\\b|\\\.venv\\|\\\.vscode\\|\\__pycache__\\|\\\.pytest_cache\\|\\bnode_modules\\b|Thumbs\.db$|\\\.DS_Store$'
$allFiles = Get-ChildItem -Path $repoRoot -Recurse -File -ErrorAction Stop |
  Where-Object { $_.FullName -notmatch $excludeRegex }

# CLEAN zip = text-first (small upload)
$textExt = @(
  '.md','.txt','.json','.yml','.yaml','.py','.ps1','.psm1','.psd1',
  '.code-workspace','.gitignore','.gitattributes','.csv','.tsv',
  '.toml','.ini','.cfg','.bat','.cmd','.sh','.xml'
)
$cleanFiles = $allFiles | Where-Object { $textExt -contains $_.Extension.ToLower() }

# --- Build clean_latest + rotate one stamped backup ---
New-ZipSafe -ZipPath $cleanLatest -Files $cleanFiles -BaseDir $repoRoot
$cleanCheck = Test-ZipReadable -ZipPath $cleanLatest
if (-not $cleanCheck.ok) { Write-Error "Clean zip failed: $($cleanCheck.error)" }
$cleanHash = Hash $cleanLatest

Copy-Item $cleanLatest $cleanStamped -Force

# PRUNE: keep exactly TWO clean zips: *_clean_latest.zip + newest *_clean_*.zip
# Always wrap in @() so it's an array even if 0/1 match.
$stampedCleans = @(
  Get-ChildItem $distDir -Filter "${repoName}_clean_*.zip" |
    Where-Object { $_.Name -notlike "*_clean_latest.zip" } |
    Sort-Object LastWriteTime -Descending
)

if ($stampedCleans.Count -gt 1) {
  $stampedCleans | Select-Object -Skip 1 | Remove-Item -Force -ErrorAction SilentlyContinue
}

# --- Optional full zip (assistant) ---
$assistantHash = ""
$assistantCheck = $null
if ($Full) {
  New-ZipSafe -ZipPath $assistantZip -Files $allFiles -BaseDir $repoRoot
  $assistantCheck = Test-ZipReadable -ZipPath $assistantZip
  if (-not $assistantCheck.ok) { Write-Error "Assistant zip failed: $($assistantCheck.error)" }
  $assistantHash = Hash $assistantZip
  Copy-Item $assistantZip $assistantStamp -Force

  $stampedAssist = @(
    Get-ChildItem $distDir -Filter "${repoName}_assistant_*.zip" |
      Where-Object { $_.Name -notlike "*_assistant_latest.zip" } |
      Sort-Object LastWriteTime -Descending
  )
  if ($stampedAssist.Count -gt 1) {
    $stampedAssist | Select-Object -Skip 1 | Remove-Item -Force -ErrorAction SilentlyContinue
  }
}

# --- Write index.json (small status) ---
$index = [ordered]@{
  repo           = $repoName
  generated_at   = $stamp
  clean_latest   = (Split-Path -Leaf $cleanLatest)
  clean_sha256   = $cleanHash
  clean_count    = $cleanCheck.count
  clean_sample   = $cleanCheck.sample
  assistant_zip  = if ($Full) { (Split-Path -Leaf $assistantZip) } else { $null }
  assistant_sha  = if ($Full) { $assistantHash } else { $null }
}
$index | ConvertTo-Json -Depth 5 | Set-Content -Path $indexJson -Encoding UTF8

# --- Console summary ---
Write-Host ""
Write-Host "Build Summary:"
Write-Host ("  CLEAN:     {0}  SHA256={1}" -f (Split-Path -Leaf $cleanLatest), $cleanHash)
if ($Full) { Write-Host ("  ASSISTANT: {0}  SHA256={1}" -f (Split-Path -Leaf $assistantZip), $assistantHash) }
Write-Host ("  INDEX:     {0}" -f (Split-Path -Leaf $indexJson))

Write-Host "`nKept in dist/:"
(Get-ChildItem $distDir -File | Sort-Object LastWriteTime -Descending).Name | ForEach-Object { Write-Host "  $_" }
