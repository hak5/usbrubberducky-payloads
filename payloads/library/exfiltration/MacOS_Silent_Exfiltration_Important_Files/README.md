# Silent File Exfiltrator using Discord Webhooks - MacOS

**Category**: Exfiltration
**OS**: MacOS
**Version**: 1.0

**Note**: This script is created for Original USB Rubber Ducky, This may not work on the newer version of rubber ducky but I am not sure.

## Description
A stealth script that silently collects and exfiltrates files through Discord webhooks. The script automatically searches for specific file types, sends them to a Discord channel, and removes all traces of the operation.

## Features
* Completely silent operation with no visible windows
* Automatic terminal cleanup
* Searches common user directories
* Handles multiple file types
* Size-aware file selection
* Self-cleaning operation
* No USB storage required

## Getting Started

### Dependencies
* macOS operating system
* Internet connection
* Valid Discord webhook URL

### File Types Supported
* PDF documents (*.pdf)
* Word documents (*.doc, *.docx)
* Text files (*.txt)
* Images (*.jpg, *.png)
* Add more if you want

### Configuration
Replace the Discord webhook URL in the script:
```DuckyScript
STRING WEBHOOK="YOUR-DISCORD-WEBHOOK-URL"
```

### Size Limits
* Maximum file size: 8MB (Discord limitation)
* Search depth: 3 directories deep
```DuckyScript
STRING find ~/ -type f \( ... \) -size -8M -maxdepth 3
```

### Timing Configuration
Key delay points that may need adjustment:
```DuckyScript
DELAY 2000    # Initial system setup
DELAY 1000    # Terminal opening
DELAY 500     # Command execution
```

## Security Considerations
* The script operates silently in the bg.
* Removes temporary files
* Clears Terminal history
* Disables Terminal prompts
* Self-terminates after completion

## Notes
* File transfer speed depends on internet connection
* Consider file size limits when modifying search parameters
* Adjust delays based on target system performance

## Disclaimer
This tool is provided for educational and authorized testing purposes only. Always obtain proper authorization before deployment.

## Troubleshooting
* If files aren't being sent, verify webhook URL
* For slow systems, increase DELAY values
* Check internet connection if uploads fail
* Verify file permissions if searches fail

## Clean Up
Script automatically:
* Removes temporary directory
* Clears command history
* Closes Terminal
* Restores system settings

## Reference Video
No video needed as operation is completely straightforward.
