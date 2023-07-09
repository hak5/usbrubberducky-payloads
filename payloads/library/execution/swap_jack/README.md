## About:
* Title: swap_jack
* Description: swap_jack, simple yet powerful payload which can be used to replace one command with another on target's system.
* AUTHOR: drapl0n
* Version: 1.0
* Category: Execution.
* Target: Unix-like operating systems.
* Attackmodes: HID, Storage.

## swap_jack: Simple yet Powerful payload which can be used to replace one command with another on target's system. swap_jack gives your target capability to trigger backdoors for you.

### Features:
1. Swap commands/Execute scripts covertly.
2. Persistent.
3. Can swap multiple commands.
4. Makes your target run commands/script for you.

### Usage:
* To swap custom commands make following changes at line `18` in `payload.sh`:
* Default swaped commands: `swap_array='alias ls=\"du\" \\n alias cd=\"dh\" \\n alias cat=\"lsblk\"'`.
* Example: Swapping `pwd` command with `find`: 
* Add entry seperated by `\\n` to the line `18`: `swap_array='alias ls=\"du\" \\n alias cd=\"dh\" \\n alias cat=\"lsblk\"' \\n alias pwd=\"find\"`

#### Support me if you like my work:
* https://twitter.com/drapl0n 
