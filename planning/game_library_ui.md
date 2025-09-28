# game_library_ui.md — Step 0: Library of Games  
*Planning Scroll — safety_joy_gentle_bounce_ai_0/planning/*

---

## 🌱 Purpose

This scroll defines the **UI contract** for Step 0 —  
the Library of Games where players first meet the Little Friends.  

The design must be:
- **Child-first**: bright, simple, welcoming.  
- **Parent-friendly**: clear paths to Invisible Friends (locked by puzzle).  
- **Future-proof**: expandable to show whole teams (“hands”) instead of flat icons.  

---

## 🎨 Main Headings

- **Children’s Garden** 🌈 → Outer Friends (safe, wordless, playable immediately).  
- **Parent’s Workshop** 🔒 → Invisible Friends (team leaders, forge, planning).  

---

## 🌈 Color Grouping

Each Friend (Outer) is shown as a **colored seed icon**.  
The seven tones of the Founding Octave map to seven color groups:  

1. Red → Safety & Joy  
2. Orange → Curiosity & Motion  
3. Yellow → Color & Emotion  
4. Green → Rest & Awareness  
5. Blue → Loops & Recursion  
6. Indigo → Tempo & Harmony  
7. Violet → Change & Evolution  

Color anchors the Friend visually; parents see the same scheme in Inner views.  

---

## ✋ Palm & Fingers Visualization

- Friends are grouped in **“hands” of five icons**.  
- Four icons = **Fingers** (Outer Friends, visible to children).  
- One icon = **Palm** (Invisible Friend, locked).  

### Rules:
- Hands always enter, play, and leave games **together**.  
- Children tap a Finger → play its game.  
- Parents unlock the Palm → see planning, forge, orchestration.  

---

## 📱 UX Invariants

- Big tappable icons (≥ 64×64 px).  
- Wordless navigation → icons, shapes, and color only.  
- No fail state, no timers → exploration feels safe.  
- Parent gateway → subtle lock on Palm icons, opens with puzzle or code.  

---

## 🌳 Next Steps

- Prototype a **mock grid layout**: 2 headings (Children/Parents), 7 colors, Hands under each.  
- Add “Palm lock” placeholder → tap shows a gentle puzzle for parents.  
- Keep scroll synced with `palm_and_fingers.md` for consistency.  
