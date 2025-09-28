# 🧩 Roles of Each Section

## Outer Friends
- For children. Wordless, colorful, musical.  
- Each holds only **safe public files** (`story.md`, `assets/`, `config.public.json`).  
- Always playable, never overwhelming.  

## Invisible Friend (Team Leader)
- For creators/parents.  
- Holds **plans, orchestration logic, schemas, tests, and exports**.  
- Manages **control nodes**, each aligned with one Outer Friend.  
- Hosts the **Forge**, where new Friends can be created.  
- Serves as the **team leader**, delegating tasks and approving updates.  

## Team Planning
- `planning.md`: band-level roadmap.  
- `team_structure.md`: structural contract.  

---

# 🎈 Outer Friend UX Invariants (for very young children)

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
- Children encounter only **Outer Friend** files.  
- Parents/creators unlock the **Invisible Friend** with a **gatekeeping puzzle** (optional).  
- **Forge** is isolated: creation remains play, but under adult guidance.  
- All artifacts include `"mtc_schema": "<domain>/<semver>"` and basic provenance tags.  

---

# ✅ Release Gate (minimum)
1. Tests green (`step_1_4_invisible/tests`).  
2. Schemas validated (`step_1_4_invisible/schema`).  
3. Outer Friend UX invariants satisfied.  
4. Parent/Maker approval recorded.  
5. Publish & update launcher registry.  
