<# Palm Rituals — Step 1
Runs: re-export → UTF-8+JSON validate → build clean zips
#>

$ErrorActionPreference = 'Stop'
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$repo = Resolve-Path "$here\..\..\.."  # repo root from rituals/

Write-Host "🫧 Re-exporting Friends..." -ForegroundColor Cyan
$friends = @(
  @{ id='step_1_1_puffball';   path='step_1\step_1_1_puffball'   },
  @{ id='step_1_2_bloomtail';  path='step_1\step_1_2_bloomtail'  },
  @{ id='step_1_3_melodybug';  path='step_1\step_1_3_melodybug'  },
  @{ id='step_1_4_rippleleaf'; path='step_1\step_1_4_rippleleaf' }
)

Push-Location $repo
try {
  foreach ($f in $friends) {
    $code = Join-Path $repo "$($f.path)\code.py"
    $out  = Join-Path $repo "$($f.path)\exports\play.json"

    # Ensure exports/ exists
    $null = New-Item -ItemType Directory -Force -Path (Split-Path $out -Parent)

    # Re-export with UTF-8-safe pipeline
    python $code | Set-Content $out -Encoding UTF8
  }

  Write-Host "🔎 Validating UTF-8 + mtc_node..." -ForegroundColor Cyan
  $expected = @{
    'step_1_1_puffball'   = 'step_1_1_0'
    'step_1_2_bloomtail'  = 'step_1_2_0'
    'step_1_3_melodybug'  = 'step_1_3_0'
    'step_1_4_rippleleaf' = 'step_1_4_0'
  }

  foreach ($f in $friends) {
    $out  = Join-Path $repo "$($f.path)\exports\play.json"
    $raw  = Get-Content $out -Raw -Encoding UTF8
    $json = $raw | ConvertFrom-Json

    if ($json.mtc_node -ne $expected[$f.id]) {
      throw "mtc_node mismatch for $($f.id): '$($json.mtc_node)' != '$($expected[$f.id])'"
    }

    Write-Host "OK: $($f.id) mtc_node=$($json.mtc_node) (UTF-8 valid)" -ForegroundColor Green
  }

  Write-Host "📦 Building clean zips..." -ForegroundColor Cyan
  pwsh -NoProfile -ExecutionPolicy Bypass -File "$repo\make_zips.ps1"

  Write-Host "✅ Rituals complete." -ForegroundColor Green
}
finally {
  Pop-Location
}
