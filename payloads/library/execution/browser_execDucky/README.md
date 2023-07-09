## About:
# Title: browser_execDucky
# Description: browser_execDucky finds browser installed in target's system and searche URL in it.
# AUTHOR: drapl0n
# Version: 1.0
# Category: Execution.
# Target: Unix-like operating systems.
# Attackmodes: HID

## browser_execDucky: A payload which finds installed browser in target's system and searchs URL in it. This payload can be used as a module to craft a new payload which requires browser execution in it.

### Workflow:
1. Executing Terminal Emulator.
2. Prevent storing history.
3. Storing script in target's system.
4. Granting execution privilege.
5. Executing script in background.

### Usage:

* Replace URL at line `15` in `payload.txt` with URL you want to search for.

#### Support me if you like my work:
* https://twitter.com/drapl0n 
