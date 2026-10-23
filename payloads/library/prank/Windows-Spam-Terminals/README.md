# Windows Spam Terminals

This script is designed to work on Windows devices. It opens an infinite number of PowerShell terminals, effectively spamming the system with terminal instances.

Be very careful about using this payload as this activity could alter the state of the computer by causing unsaved data to be lost. For this reason make sure you are authorized before running this script otherwise you may risk a loss of data.

### Details

- **Title**: Windows Spam Terminals
- **Author**: bst04 - Aleff
- **Version**: 1.0
- **Category**: Prank
- **Target**: Windows

### Dependencies

This payload is plug and play <3

## How It Works 📜

1. Uses an extension (`EXTENSION PASSIVE_WINDOWS_DETECT`) to detect when the device is ready
2. After readiness is confirmed, the script execute a powershell script that create an infinite number of PowerShell terminals

