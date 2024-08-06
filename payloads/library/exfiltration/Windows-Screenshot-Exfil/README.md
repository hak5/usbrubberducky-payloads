# Windows Screenshot Exfiltration Payload

## Overview

This payload captures screenshots from a Windows machine every 10 seconds and uploads them to a specified server using the Powershell. The payload is designed to run until the window is closed or the loop is broken out.

## Features

- **Target OS**: Windows 10, 11
- **Exfiltration Method**: Screenshots are taken and uploaded to a server every 10 seconds.
- **Detection and Execution**: Automatically detects if the target OS is Windows and executes the payload accordingly.
- **HID Emulation**: Emulates a Lenovo keyboard with a random serial number.
- **Fallback**: If the OS is not Windows, the USB Rubber Ducky will function as a storage device.

## Files

- `payload.txt`: The main script that is deployed to the USB Rubber Ducky.
- `script.ps1`: The Staged PowerShell script that takes screenshots and uploads them to the server.

## Setup Instructions

1. **Server Setup**: Set up a server to receive the uploaded screenshots and host the script.ps1 file. I used [IngoKl/HTTPUploadExfil](https://github.com/IngoKl/HTTPUploadExfil) as it is pretty easy to set up.
2. **Update URLS**: Modify `script.ps1` to include your server URL where the screenshots will be uploaded and modify `payload.txt` to reference the URL of the hosted `script.ps1`
    - `$url` in `script.ps1`
    - `#MY_STAGED_SCRIPT` in `payload.txt`
3. **Upload Files**:
   - Inject `payload.txt` on the USB Rubber Ducky.
   - Host `script.ps1` on a web server.

Note: In the provided files, the exanple URLs are followed by `/l` in the payload and by `/p` for the sending of screenshots, this is because I use HTTPUploadExfil, modify this is you do not use the same exfil server as I do.

## Usage

### Payload Execution

1. **Insert USB Rubber Ducky**: Plug the USB Rubber Ducky into the target machine.
2. **OS Detection**: The payload automatically detects if the target OS is Windows.
3. **Payload Deployment**:
   - If Windows is detected, it emulates a Lenovo keyboard, opens PowerShell, and runs the PowerShell script.
   - If the target OS is not Windows, it switches to storage mode (Usefull for dev purposes).

### PowerShell Script Execution

The PowerShell script (`script.ps1`) runs the following commands:

1. Takes a screenshot every 10 seconds.
2. Uploads the screenshot to the specified server.
3. Repeats until the PowerShell window is closed.


## Alternative

Some EDR detect the download of a powershell script from internet, this clould led to the payload beeing blocked. As an alternative, you could take the content of `script.ps1` and put in directly in the payload.

```
GUI r
DELAY 500
STRINGLN powershell
DELAY 500
STRINGLN
    [... The content of script.ps1 here ...]
END_STRINGLN
ENTER
DELAY 500
ALT SPACE
STRING n
```