# ShadowPuppet

**Author:** Coderace  
**Category:** Remote-Access / HID Payload  
**Target:** Windows 10 / Windows 11

---

## Overview

ShadowPuppet is a stealthy HID-based remote access payload designed for Windows 10 and 11.  
It uses PowerShell to create hidden command-and-control sessions from a remote server, while disabling key Windows security features to avoid detection.

---

## How It Works

1. **Payload Activation**  
   When the payload runs on the target machine via USB HID injection, it first checks if execution is enabled (`EXECUTE_PAYLOAD` flag). If true, the process proceeds.

2. **Primary PowerShell Session**  
   The payload opens the Windows Run dialog (`GUI r`) and launches a hidden PowerShell window with bypassed execution policy.  
   It sets two variables:  
   - `$lp`: the listening port (e.g., 9000)  
   - `$url`: the URL of the primary PowerShell script hosted remotely (`REMOTE_PS_URL`)  

   It then downloads and executes the script directly from `$url` using `Invoke-Expression (iex)` on the downloaded content.

3. **Secondary PowerShell Session and Evasion**  
   A second hidden PowerShell session launches, dedicated to disabling security features:  
   - **AMSI (Anti-Malware Scan Interface)** is disabled by modifying internal PowerShell types to prevent script scanning.  
   - **ScriptBlockLogging** and **ModuleLogging** are turned off in the registry to reduce logging visibility.  
   - **Windows Defender Real-Time Monitoring** is disabled via WMI commands.  
   - Specific event providers related to security events are disposed to limit logging.  

4. **Secondary Payload Execution**  
   The payload decodes a Base64 encoded URL (`SECONDARY_B64`), retrieves a second PowerShell script from that URL, and executes it similarly to the primary script. This allows flexible multi-stage payload delivery.

5. **Log and History Cleanup**  
   After execution, the payload clears Windows event logs related to Security, System, Application, and PowerShell to erase traces of its activity.  
   It also deletes the PowerShell command history file to remove command traces.

6. **Visual Feedback**  
   Throughout the process, the HID device LEDs provide status feedback:  
   - Red LED indicates payload execution start  
   - Green LED indicates successful completion  
   - LEDs are turned off after completion.

---

## Configuration

Before use, set these variables according to your environment:

| Variable          | Description                                      | Example Value                                   |
|-------------------|-------------------------------------------------|------------------------------------------------|
| `EXECUTE_PAYLOAD` | Enables or disables payload execution (TRUE/FALSE) | `TRUE`                                         |
| `REMOTE_PS_URL`   | URL hosting the primary PowerShell script       | `https://yourdomain.com/streamer/stream.ps1`  |
| `SECONDARY_B64`   | Base64 encoded URL of the secondary PowerShell payload | `aHR0cHM6Ly95b3VyZG9tYWluLmNvbS9wYXlsb2Fkcy9zZWNvbmQucHMx` |
| `LISTEN_PORT`     | Port number for listener (used in scripts)      | `9000`                                         |

---

This approach leverages PowerShell's native capabilities and Windows internals to maintain stealthy, persistent, and flexible remote access, controlled entirely by remotely hosted scripts.  
ShadowPuppet is designed to evade detection and maintain control while cleaning traces of its execution.

