## About:
* Title: mysql_dump
* Description: mysql_dump, a oneliner payload used to exfiltrate mysql history. Looting mysql history can be useful understanding targets database schema.
* AUTHOR: drapl0n
* Version: 1.0
* Category: Exfiltaration
* Target: Unix-like operating systems with systemd.
* Attackmodes: HID.

## mysql_dump: mysql_dump payload exfiltrates MySQL history, which can be used to understand targets database schema.

### Features:
* Exfiltrates mysql_history.
* Fully Persistent.
* Waits for target to get online.
* Transfers loot once target is online.
* Oneliner payload.

### Workflow:
1. Search if mysql_history file is present.
2. Creating Loot transfer mechanism in targets system.
3. Creating local systemd service for persistence.
4. Executing Autotart mechanism.

### Usage:
1. Run netcat listner on attacking machine: `nc -lvp <port number> > <output_filename>`
2. Example: `nc -lvp 4444 > mysql_history.txt

### Changes to be made:
* Replace IP address(twice) `0.0.0.0` and Port Number `4444` on line `15`.

#### Support me if you like my work:
* https://twitter.com/drapl0n 
