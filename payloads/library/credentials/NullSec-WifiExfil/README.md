# NullSec-WifiExfil

> **USB Rubber Ducky payload — WiFi Credential Exfiltrator**

## Description

Extracts all saved WiFi network profiles and their passwords from a Windows 10/11 target using `netsh wlan` commands. Results are exfiltrated via Discord webhook.

## Features

- Enumerates all saved WiFi profiles
- Extracts plaintext passwords (WPA/WPA2 key content)
- Captures authentication type for each network
- Reports hostname and username for identification
- Single-line PowerShell execution (no temp files)
- Hidden window execution
- Discord webhook exfiltration

## Setup

1. Edit `payload.txt` and replace `YOUR_WEBHOOK_URL` with your Discord webhook URL
2. Flash to your USB Rubber Ducky

## Output Format

```
WiFi Credentials - HOSTNAME (username)
NetworkName1 | WPA2-Personal | password123
NetworkName2 | WPA2-Enterprise | (no key)
OpenNetwork | Open | (no key)
```

## Target

- **OS:** Windows 10/11
- **Privileges:** Standard user (no admin required for viewing saved profiles)
- **Note:** Admin required to see passwords on some configurations

## Author

NullSec (bad-antics)
