# NullSec Network Mapper

**Author:** NullSec (bad-antics)  
**Version:** 1.0  
**Category:** Recon  
**Target:** Windows 10/11  
**Device:** USB Rubber Ducky (New)

## Description

Automated network discovery and mapping payload using only native Windows commands — no external tools required.

### Collected Data

- **Local Interfaces** — Active adapters, MAC addresses, IPs, link speeds
- **ARP Table** — All known neighbors with MAC addresses
- **Routing Table** — Network routes with metrics
- **DNS Cache** — Recently resolved hostnames  
- **Network Shares** — SMB shares and mapped drives
- **Active Connections** — All established TCP connections with process names
- **Listening Services** — Open ports and associated services
- **Subnet Ping Sweep** — Discovers alive hosts on the local /24 subnet
- **Port Scan** — Quick scan of common ports on the default gateway

## Setup

1. Label your Rubber Ducky volume as `DUCKY`
2. Compile and deploy
3. Insert into target machine

## Output

Report saved as `network_map_YYYYMMDD_HHMMSS.txt` on the Ducky drive.

## Timing

The ping sweep and port scan take approximately 20-30 seconds total. Full execution time is ~45 seconds.

## Notes

- Zero external dependencies — uses only built-in PowerShell cmdlets
- Scans the /24 subnet of the default gateway
- Port scan uses async TCP connections with 500ms timeout
- Cleans up PowerShell history
- For authorized penetration testing only
