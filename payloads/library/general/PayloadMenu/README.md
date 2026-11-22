# Ducky Lock-Key Menu

A **USB Rubber Ducky** payload (DuckyScript 3.0) that turns Notepad into an on-screen menu you drive with the keyboard's **lock keys**. Pick from up to 10 payloads at runtime instead of flashing a new `inject.bin` for each one.

```
==== DUCKY MENU ====
NUM=Down  SCROLL=Up  CAPS=Select

[ ] 01. Windows prank
[>] 02. WiFi Info
[ ] 03. RickRoll on Startup
[ ] 04. Menu 4
[ ] 05. Menu 5
[ ] 06. Menu 6
[ ] 07. Menu 7
[ ] 08. Menu 8
[ ] 09. Menu 9
[ ] 10. Menu 10
[ ] 11. Exit

Status: ran WiFi Info
```

## Controls

| Key             | Action                                                         |
|-----------------|----------------------------------------------------------------|
| **Num Lock**    | Move down (wraps from the last item back to the top)           |
| **Scroll Lock** | Move up (wraps from the top to the last item)                  |
| **Caps Lock**   | Run the selected item                                          |

Because moving down wraps around, **Num Lock and Caps Lock are enough** to use the whole menu, which helps on laptops that have no Scroll Lock key.

## Requirements

- USB Rubber Ducky (Mark II) with **DuckyScript 3.0**
- Windows target (Windows 10 / 11)
- [Hak5 PayloadStudio](https://payloadstudio.hak5.org) (or another DuckyScript 3 compiler) to build `inject.bin`

## How it works

1. Opens Notepad from the Run dialog (`WIN+R` → `notepad`), then presses `CTRL+N` for a blank document. This stops Windows 11 Notepad's restored tabs from being overwritten.
2. Saves the host's current lock-key state so it can be put back on exit.
3. Draws the menu, then checks `$_NUMLOCK_ON`, `$_SCROLLLOCK_ON` and `$_CAPSLOCK_ON` every 50 ms. Windows sends lock-key LED changes to every attached keyboard, including the Ducky, so the Ducky can tell when you press a lock key on the real keyboard.
4. Each move clears Notepad (`CTRL+A`) and redraws the whole menu with the `[>]` marker on the new selection.
5. When you select an item, the payload turns **Caps Lock off and confirms it** before running anything, so typed text keeps its correct case. It then waits for the lock states to settle so one press can't run an item twice.

## Adding your payloads

### 1. Name the items

Edit the labels near the top of `payload.txt`. They appear in the menu and on the status line:

```
DEFINE #LABEL01 WiFi Info
DEFINE #LABEL02 System Info
DEFINE #LABEL03 Menu3
...
DEFINE #LABEL10 Menu 10
```

> Labels use two digits (`#LABEL01`, not `#LABEL1`). Otherwise `#LABEL1` would also match the start of `#LABEL10`.

### 2. Add the code

Each item has its own function, `MENU1()` through `MENU10()`. Put your payload between `CAPS_OFF()` and `$last`:

```
FUNCTION MENU1()
    REM Caps OFF first - selecting with CAPS may have turned it on
    CAPS_OFF()
    REM [#LABEL01 payload goes here]
    $last = 1
END_FUNCTION
```

- Keep `CAPS_OFF()` as the first line.
- Keep `$last = N` as the last line. It updates the status line.

> **Important:** if your payload opens another window (PowerShell, cmd, a browser, etc.), it **must bring Notepad back into focus before it ends**. The next redraw sends `CTRL+A` and types into whichever window is in front.

## Exit

Selecting **11. Exit**:

1. Clears the menu text
2. Closes Notepad with `ALT+F4` and picks **Don't Save** (`ALT+N`)
3. Restores the host's original Num / Caps / Scroll Lock state
4. Stops the payload

## Build & deploy

1. Open `payload.txt` in PayloadStudio.
2. Edit the labels and `MENUx()` functions.
3. Compile to `inject.bin`.
4. Copy `inject.bin` to the root of the Ducky's storage and plug it into the target.

## Troubleshooting

| Problem | Fix |
|---|---|
| Menu doesn't move when pressing lock keys | Make sure you're running the latest build, and that the target keyboard's lock keys toggle the LEDs. |
| Typed text is in the wrong case | `CAPS_OFF()` must be the first line of each `MENUx()`. |
| Notepad doesn't open in time / text is cut off | Increase the `DELAY` values after `GUI r` and `ENTER` in the startup section (slow machines). |
| Exit leaves Notepad open at the save prompt | Increase `DELAY 800` after `ALT F4` in `MENU_EXIT()`. |
| No Scroll Lock key | Use Num Lock only; the menu wraps around. |

## Files

| File | Description |
|---|---|
| `payload.txt` | The payload (DuckyScript 3.0 source) |
| `README.md` | This file |

## Legal

For use only on systems you own or have explicit permission to test. The author is not responsible for misuse.

## Author

**RootJunky**: [rootjunky.com](https://rootjunky.com)
