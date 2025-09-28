# leadership.md — Invisible Friend (Team Leader)

## 🎯 Role
The **Invisible Friend** is the team-level leader/orchestrator. It owns the forge and safety rails, delegates work to controllers, and signs off on releases to the Outer Friends.

---

## 🧭 RACI (at a glance)

| Role                              | Owns                         | Decides                         | Does                                     | Reviews                 |
|-----------------------------------|------------------------------|---------------------------------|-------------------------------------------|-------------------------|
| **Invisible Friend (Team Leader)**| Forge, schemas, tests, release | Team priorities, gates, safety | Orchestrates tasks to controllers         | Final approval / publish |
| **Controller Node (per friend)**  | Friend-specific tools        | Local implementation details    | Build assets/logic from wishlets          | Submits to Invisible Friend |
| **Outer Friend (child game)**     | Play surface                 | –                               | Receives safe updates                     | –                       |
| **Parent / Maker**                | Inputs, settings             | Enable/disable features         | Curate wishlets, run forge                | Approve changes         |

---

## 🔒 Safety Invariants
- Outer Friends remain **wordless, colorful, musical**, free of debug data.
- Inner tools are behind the **gatekeeper puzzle** (parent/creator unlock).
- All artifacts carry `"mtc_schema": "<domain>/<semver>"` and provenance tags.

---

## 📦 Release Checklist (team-level)
1. ✅ Controller tasks complete (per-friend).
2. ✅ Tests green (`invisible_friend/tests`).
3. ✅ Schemas validated (`invisible_friend/schemas`).
4. ✅ Provenance stamped (mentor + wishlets noted).
5. ✅ Parent/Maker approval recorded.
6. ✅ Publish to Outer Friend(s) and update launcher registry.

---

## 🔁 Flow (typical iteration)
1. Child play produces **wishlets** (taps, colors, shapes).
2. Parent unlocks gate → runs **forge** with selected wishlets.
3. Controllers build/update friend logic/assets safely.
4. Invisible Friend reviews → publishes to the Outer Friend.
5. Launcher shows updated friend; kids play immediately.

---

## 📂 Where things live
- `step_1/invisible_friend/forge/` — recipes, templates, pipeline
- `step_1/invisible_friend/schemas/` — data contracts
- `step_1/invisible_friend/tests/` — automated checks
- `step_1/invisible_friend/nodes/<friend>_controller/` — per-friend tools
- `step_1/outer_friends/<friend>/outer_mind/` — child-facing game

---

## 🗺️ Future Option
Later, crown a **visible Team Leader** (mascot) without refactoring: keep Invisible Friend as orchestrator; add a captain UI overlay to one Outer Friend.
