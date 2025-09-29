# Team Structure (Step 1)
Local child of [planning/team_configuration.md](../planning/team_configuration.md).  

## 📂 Contract
- **IDs:** `step_1`, `step_1_1..step_1_4`, `step_1_*_*` dream nodes  
- **Enter/Play/Leave as one:** Hand-level sessions; Fingers don’t roam alone  
- **Palm visibility:** creator-only; no child assets under `step_1_0_invisible/`  
- **Artifacts:** Finger runtime → `json/`; outputs → `exports/`  
- **Keepers:** add `.gitignore` in `step_1_0_invisible/{schema,tests,exports}/` with:

## 📂 Folder Layout
_(Reference diagram; mirrors on-disk structure with Hand-specific notes)_

Note: Palm internal node reserved as step_1_0_0 (zero-based); instantiate only when orchestration needs a concrete node.

```text
step_1/                       # First Hand of Little Friends
├── README.md                 # overview of this Hand (child-facing names + tone)
├── planning.md               # plan for the whole Hand (milestones, goals)
├── team_structure.md         # local child of repo-level planning/team_configuration.md
├── step_1_0_invisible/       # Palm (Invisible Friend, Inner Mind, Team Leader - puzzle unlocks)
│   ├── planning.md           # inner plan, development log
│   ├── control_nodes/        # one controller per Finger
│   │   ├── puffball_controller.md
│   │   ├── bloomtail_controller.md
│   │   ├── melodybug_controller.md
│   │   └── rippleleaf_controller.md
│   ├── code/                 # orchestration logic
│   │   └── main.py
│   ├── forge/                # “friend helps make friends”
│   │   ├── mentor_map.json
│   │   ├── recipes/
│   │   └── templates/
│   ├── schema/               # JSON schemas, data contracts
│   ├── tests/                # automated checks
│   ├── exports/              # compiled outputs, zips, snapshots
│   ├── step_1_0_0/           # (reserved) Palm’s first internal node — not scaffolded yet
│   └── README.md             # notes/tools; no child-visible assets
├── step_1_1_puffball/                  # Finger 1 (Outer Friend)
│   ├── planning.md
│   ├── story.md
│   ├── code.py
│   ├── json/
│   │   └── .gitignore        # keep folder, ignore contents
│   ├── exports/
│   │   └── .gitignore        # keep folder, ignore contents
│   └── step_1_1_0/           # core dream node for this Finger
├── step_1_2_bloomtail/                 # Finger 2 (Outer Friend)
│   ├── planning.md
│   ├── story.md
│   ├── code.py
│   ├── json/
│   │   └── .gitignore
│   ├── exports/
│   │   └── .gitignore
│   └── step_1_2_0/
├── step_1_3_melodybug/                 # Finger 3 (Outer Friend)
│   ├── planning.md
│   ├── story.md
│   ├── code.py
│   ├── json/
│   │   └── .gitignore
│   ├── exports/
│   │   └── .gitignore
│   └── step_1_3_0/
└── step_1_4_rippleleaf/                 # Finger 4 (Outer Friend) 
    ├── planning.md
    ├── story.md
    ├── code.py
    ├── json/
    │   └── .gitignore
    ├── exports/
    │   └── .gitignore
    └── step_1_4_0/       
```
