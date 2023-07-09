## About:
# Title: SHELL_TRIGGER
# Description: SHELL_TRIGGER is an payload which triggers commands/scripts on shell execution on target's system OR triggers commands/scripts when target executes terminal emulator.
# AUTHOR: drapl0n
# Version: 1.0
# Category: Execution.
# Target: Unix-like operating systems.
# Attackmodes: HID

## SHELL_TRIGGER: SHELL_TRIGGER is payload which triggers commands/scripts on shell execution on target's system OR triggers commands/scripts when target executes terminal emulator.

### Workflow:
1. Executing Terminal Emulator.
2. Prevent storing history.
3. Storing script in target's system.
4. Granting execution privilege.
5. Executing script in background.

### Changes to be made:
* Replace command on line `15` in `payload.txt` with command/script you want your target to execute on shell execution.

#### Support me if you like my work:
* https://twitter.com/drapl0n 
