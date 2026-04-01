# File Check Storage Mode

This extension checks if a specific file exists in the USB Rubber Ducky storage. If the file is found, the Ducky immediately switches to ATTACKMODE STORAGE (mounting as USB mass storage) and stops all payload execution.

This is useful for safely protecting your Ducky when a specific trigger file (like "PASSWORD") is detected, allowing you to enter storage mode without executing the payload.

## Target Environment

- **Target**: All systems (DuckyScript 3.0+)
- **Payload Type**: Extension Function

## Usage

Insert this extension at the beginning of your payload to check for the trigger file before executing any commands.

### Basic Example

```DuckyScript
ATTACKMODE HID KEYBOARD
INCLUDE payloads/extensions/community/FILE_CHECK_STORAGE_MODE/file_check_storage_mode.txt

FILE_CHECK_STORAGE_MODE()

REM Your normal payload starts here
DELAY 1000
STRING echo "Hello World"
ENTER
