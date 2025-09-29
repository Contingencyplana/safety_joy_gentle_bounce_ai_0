#!/usr/bin/env python3
# Puffball — minimal text-first "play" node
# Prints a tiny JSON event to stdout for tooling to capture.

import json, time, sys

# Ensure emoji-safe UTF-8 output on Windows consoles
if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8")

def play():
    return {
        "mtc_schema": "play/1.0.0",
        "mtc_node":   "step_1_1_0",
        "friend":     "puffball",
        "tone":       "C",
        "feel":       "gentle",
        "event":      "single_bounce",
        "ts":         time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime())
    }

if __name__ == "__main__":
    print(json.dumps(play(), ensure_ascii=False, indent=2))
