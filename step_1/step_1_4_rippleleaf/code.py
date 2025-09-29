#!/usr/bin/env python3
# Rippleleaf — minimal stub "play" node
# Prints a tiny JSON event to stdout for tooling to capture.

import json, sys

# Ensure emoji-safe UTF-8 output on Windows consoles
if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8")

payload = {
    "mtc_schema": "play/1.0.0",
    "mtc_node":   "step_1_4_0",
    "friend": {
        "id": "step_1_4_rippleleaf",
        "name": "Rippleleaf",
        "emoji": "🍃"
    },
    "event": {
        "type": "group_motion_seed",
        "tone": "C",
        "feel": "flow"
    }
}

if __name__ == "__main__":
    json.dump(payload, sys.stdout, ensure_ascii=False, indent=2)
