#!/usr/bin/env python3
import json, sys

payload = {
  "mtc_schema": "play/1.0.0",
  "mtc_node": "step_1_4_0",
  "friend": { "id": "step_1_4_rippleleaf", "name": "Rippleleaf", "emoji": "🍃" },
  "event": { "type": "group_motion_seed", "tone": "C", "feel": "flow" }
}

json.dump(payload, sys.stdout, ensure_ascii=False, indent=2)
