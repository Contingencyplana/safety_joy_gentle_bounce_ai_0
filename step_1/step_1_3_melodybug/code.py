#!/usr/bin/env python3
import json, sys

payload = {
  "mtc_schema": "play/1.0.0",
  "mtc_node": "step_1_3_0",
  "friend": { "id": "step_1_3_melodybug", "name": "Melodybug", "emoji": "🎵" },
  "event": { "type": "melody_seed", "tone": "C", "feel": "bright" }
}

json.dump(payload, sys.stdout, ensure_ascii=False, indent=2)
