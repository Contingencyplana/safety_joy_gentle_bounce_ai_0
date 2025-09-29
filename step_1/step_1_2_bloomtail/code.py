#!/usr/bin/env python3
import json, sys

payload = {
  "mtc_schema": "play/1.0.0",
  "mtc_node": "step_1_2_0",
  "friend": { "id": "step_1_2_bloomtail", "name": "Bloomtail", "emoji": "🌸" },
  "event": { "type": "call_response_seed", "tone": "C", "feel": "gentle" }
}

json.dump(payload, sys.stdout, ensure_ascii=False, indent=2)
