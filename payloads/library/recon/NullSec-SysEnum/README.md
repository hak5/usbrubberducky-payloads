# NullSec-SysEnum

> **USB Rubber Ducky payload — Comprehensive System Enumerator**

## Description

Performs deep system enumeration on Windows 10/11 targets, saving all results to the Ducky's USB storage for physical retrieval. No network exfiltration required — perfect for air-gapped environments.

## Data Collected

| Category | Details |
|----------|---------|
| System Info | OS version, architecture, domain, hotfixes, boot time |
| Network | IP config, adapters, ARP table, routing table |
| Users | Local accounts, admin group members |
| Processes | Running processes with PID, CPU, memory |
| Services | All running services |
| Software | Installed programs from registry |
| Tasks | Scheduled tasks with authors |
| Firewall | Profile states (Domain/Private/Public) |
| AV/EDR | Installed antivirus, running security processes |

## Setup

1. Format your Ducky's storage as FAT32 with label `DUCKY`
2. Flash `payload.txt` to your Rubber Ducky
3. Insert into target, wait ~15 seconds
4. Retrieve and check `loot/HOSTNAME-enum.txt`

## Output

Results are saved to `DUCKY:\loot\COMPUTERNAME-enum.txt` as a single comprehensive text file.

## Features

- Auto-detects Ducky drive by label or removable type
- Creates `loot` directory automatically  
- Hidden PowerShell window
- No admin required (some sections may have limited output)
- AV/EDR detection covers 15+ major products
- No network traffic generated

## Target

- **OS:** Windows 10/11
- **Privileges:** Standard user (admin provides fuller output)
- **Execution Time:** ~10-15 seconds

## Author

NullSec (bad-antics)
