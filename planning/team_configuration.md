# team_configuration.md — Step 1 Hand of Little Friends

## 🌱 Purpose

This scroll defines the **structural contract** for Step 1 —  
a **Hand** of Little Friends (Fingers) guided by a single **Palm** (Invisible Friend).

- **Fingers** = Outer Friends (child-facing, wordless, musical).  
- **Palm** = Invisible Friend (Inner Mind, team leader, orchestration).

The Palm leads, protects, and coordinates. The Fingers play, shine, and delight.  
Together, the team moves as a **hand**: enter, play, and leave a Tiny Video Game **as one**.

---

## 📂 Folder Layout

```text
step_0/                       # Library / Publishing Hub (text-first now; can become a website later)
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
│   └── README.md             # notes/tools; no child-visible assets
├── step_1_1_puffball/                  # Finger 1 (Outer Friend)
│   ├── planning.md
│   ├── story.md
│   ├── code.py
│   ├── json/
│   │   └── .gitignore        # keep folder, ignore contents
│   ├── exports/
│   │   └── .gitignore        # keep folder, ignore contents
│   └── step_1_1_1/           # core dream node for this Finger
├── step_1_2_bloomtail/                 # Finger 2 (Outer Friend)
│   ├── planning.md
│   ├── story.md
│   ├── code.py
│   ├── json/
│   │   └── .gitignore
│   ├── exports/
│   │   └── .gitignore
│   └── step_1_2_1/
├── step_1_3_melodybug/                 # Finger 3 (Outer Friend)
│   ├── planning.md
│   ├── story.md
│   ├── code.py
│   ├── json/
│   │   └── .gitignore
│   ├── exports/
│   │   └── .gitignore
│   └── step_1_3_1/
└── step_1_4_rippleleaf/                 # Finger 4 (Outer Friend) 
    ├── planning.md
    ├── story.md
    ├── code.py
    ├── json/
    │   └── .gitignore
    ├── exports/
    │   └── .gitignore
    └── step_1_4_1/
          
```

# 🧩 Roles of Each Section

## Fingers (Outer Friends, Little Friends)
- For children. Wordless, colorful, musical.  
- Each holds only **safe public files** (`story.md`, `assets/`, `config.public.json`).  
- Always playable, never overwhelming.  
- Act as the **fingers of the hand** — they touch, explore, and express.  

## Palm (Invisible Friend, Team Leader)
- For creators/parents.  
- Holds **plans, orchestration logic, schemas, tests, and exports**.  
- Manages **control nodes**, each aligned with one Finger.  
- Hosts the **Forge**, where new Friends can be created.  
- Serves as the **Palm of the hand** — guiding, protecting, and coordinating.  

## Team Planning
- `planning.md`: band-level roadmap.  
- `team_structure.md`: local structure contract.  

---

# 🎈 UX Invariants for Fingers (very young children)
- **Wordless first**: no text required to play; iconography only.  
- **Big taps, no precision**: target ≥ 64×64 px; gestures limited to tap/drag.  
- **No fail state**: no lives, no scores; only gentle feedback and celebration.  
- **Session-friendly**: delightful in 30–120 seconds; can loop seamlessly.  
- **Calm audio**: loudness-limited; no sudden spikes; pause/mute always visible.  
- **Color-safe**: palettes pass basic color-vision checks; rely on shape + motion too.  
- **Offline-safe**: no network dependency during play; no data capture.  

Store these as keys in `config.public.json` when relevant (e.g.,  
`"tap_target_px": 72`, `"max_session_s": 120`, `"palette": "red_warm_01"`).  

---

# 🔒 Safety & Simplicity
- Children encounter only **Finger (Outer Friend)** files.  
- Parents/creators unlock the **Palm (Invisible Friend)** with a **gatekeeping puzzle** (optional).  
- **Forge** is isolated: creation remains play, but under adult guidance.  
- All artifacts include `"mtc_schema": "<domain>/<semver>"` and basic provenance tags.  

---

# ✅ Release Gate (minimum)
1. Tests green (`step_1_4_invisible/tests`).  
2. Schemas validated (`step_1_4_invisible/schema`).  
3. Finger UX invariants satisfied.  
4. Parent/Maker approval recorded.  
5. Publish & update launcher registry.  
