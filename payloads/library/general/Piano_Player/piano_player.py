import argparse
from pathlib import Path


OS_DETECT_EXTENSION = Path(__file__).resolve().parents[4] / "payloads" / "extensions" / "os_detect.txt"


def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("notes", metavar="NOTES_FILE", help="Path to notes file")
    parser.add_argument("payload", metavar="PAYLOAD_FILE", help="Save payload code to this file")
    parser.add_argument("-p", "--press-mode", help="Deploy with press mode", action="store_true")
    return parser.parse_args()


def generate_keymap(maps: str) -> dict:
    keymap = {}
    for exp in maps.split(" "):
        note, key = exp.split("=")
        keymap[note] = key
    return keymap


def notes_to_code(roll: list, keymap: dict, tick: int, url: str, press_mode: bool) -> str:
    # Adjust tick to account for note held duration
    adjusted_tick = tick - 20
    if adjusted_tick < 20:
        raise Exception(f"tick ({tick}) is too low! Must be at least 40ms.")

    code = ""
    indent = ""
    # Head
    if not press_mode:
        with open(OS_DETECT_EXTENSION) as f:
            code += f.read() + "\n"
        code += f"""IF ($_OS == WINDOWS) THEN
    GUI r
ELSE IF ($_OS == MACOS) THEN
    COMMAND SPACE
ELSE IF ($_OS == LINUX) THEN
    CONTROL ESCAPE
ELSE
    GUI
END_IF

DELAY 1000
STRING {url}
ENTER
DELAY 2000\n
"""
    else:
        indent = "    "
        code += "ATTACKMODE HID STORAGE\n\n"

    # Function (common)
    code += f"""FUNCTION tick()
    DELAY {adjusted_tick}
END_FUNCTION\n
"""

    if press_mode:
        code += """WHILE TRUE
    WAIT_FOR_BUTTON_PRESS
"""

    # Each row is one or more note press, or a rest. Notes and rests are
    # held for 20ms (not configurable), but the total interval between rows is
    # approx. the specified tick time.
    for row in roll:
        notes = [n for n in row.split("  ") if n != "---"]
        for note in notes:
            code += f"{indent}HOLD {keymap[note]}\n"
        code += f"{indent}DELAY 20\n"
        for note in notes:
            code += f"{indent}RELEASE {keymap[note]}\n"
        code += f"{indent}tick()\n"
    if press_mode:
        code += "END_WHILE"

    return code


if __name__ == "__main__":
    args = parse_args()
    with open(args.notes) as f:
        notes = [line.strip() for line in f.readlines()]

    tick = int(notes[0].split("ms")[0])
    url = notes[1]
    keymap = generate_keymap(notes[2])
    roll = notes[4:]

    with open(args.payload, "w") as f:
        f.write(notes_to_code(roll, keymap, tick, url, args.press_mode))
