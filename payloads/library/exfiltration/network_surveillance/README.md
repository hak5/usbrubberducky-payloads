## About:
* Title: network_surveillance
* Description: network_surveillance payload exfiltrates network connections, routing tables, interface statistics, masquerade connections, and multicast memberships.
* AUTHOR: drapl0n
* Version: 1.0
* Category: Exfiltaration
* Target: Unix-like operating systems with systemd.
* Attackmodes: HID.

## network_surveillance: network_surveillance payload exfiltrates network connections, routing tables, interface statistics, masquerade connections, and multicast memberships.

### Features:
* Exfiltrates network connections, routing tables, interface statistics, masquerade connections, and multicast memberships.
* Fully Persistent.
* Waits for target to get online.
* Transfers loot once target is online.
* Oneliner payload.

### Workflow:
1. Extracts network information.
2. Creating Loot transfer mechanism in targets system.
3. Creating local systemd service for persistence.
4. Executing Autotart mechanism.

### Usage:
1. Run netcat listner on attacking machine: `nc -lvp <port number> > <output_filename>`
2. Example: `nc -lvp 4444 > network_surveillance.txt

### Changes to be made:
* Replace IP address(twice) `0.0.0.0` and Port Number `4444` on line `15`.

#### Support me if you like my work:
* https://twitter.com/drapl0n 
