# Puffball — minimal text-first "play" node
# Prints a tiny JSON event to stdout for tooling to capture.

import json, time

def play():
    return {
        "mtc_schema": "play/1.0.0",
        "mtc_node":   "step_1_1_1",
        "friend":     "puffball",
        "tone":       "C",
        "feel":       "gentle",
        "event":      "single_bounce",
        "ts":         time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime())
    }

if __name__ == "__main__":
    print(json.dumps(play(), ensure_ascii=False, indent=2))
