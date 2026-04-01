# PassFile - PASSWORD File Detection Extension

This extension checks if a file named "PASSWORD" exists on the target computer. If the file is found (whether hidden or visible), the Rubber Ducky immediately switches to **ATTACKMODE STORAGE** and stops payload execution.

## Use Case

This extension is useful for:
- **Protecting payload execution** - Prevent the payload from running if a PASSWORD file exists as a safeguard
- **Conditional payload triggering** - Only execute attacks if the PASSWORD file is not present
- **Hidden file detection** - Detects both visible and hidden PASSWORD files

## Target Environment

- **OS**: Windows 10/11
- **Requirements**: PowerShell, DuckyScript 3.0+

## Usage

Insert the extension at the beginning of your payload, right after `ATTACKMODE`:

```DuckyScript
ATTACKMODE HID KEYBOARD
INCLUDE payloads/extensions/community/PASSFILE/passfile.txt

PASSFILE()

REM Your normal payload continues here
DELAY 1000
STRING echo "Payload executed"
ENTER
```

## Configuration

### File Path

Modify the `#PassFile_PATH` define to check different locations:

```DuckyScript
DEFINE #PassFile_PATH C:\Users\Public\PASSWORD
```

#### Common Paths:

- `C:\Users\Public\PASSWORD` - Public user folder
- `C:\Users\USERNAME\Documents\PASSWORD` - Documents folder
- `C:\Users\USERNAME\Downloads\PASSWORD` - Downloads folder
- `C:\Users\USERNAME\Desktop\PASSWORD` - Desktop folder
- `C:\PASSWORD` - Root of C: drive

## How It Works

1. Opens the Windows Run dialog (`GUI r`)
2. Opens PowerShell in hidden window mode (`powershell -W H`)
3. Uses `Test-Path` to check if the PASSWORD file exists at the specified path
4. If found:
   - Switches to `ATTACKMODE STORAGE` (mounts as USB mass storage)
   - Stops all payload execution with `exit`
5. If not found:
   - Payload continues normally

## Hidden File Detection

The extension uses PowerShell's `Test-Path` with `-PathType Leaf` parameter, which detects:
- ✅ Visible PASSWORD files
- ✅ Hidden PASSWORD files (with hidden attribute set)
- ✅ System PASSWORD files

## Example Payload

```DuckyScript
ATTACKMODE HID KEYBOARD
INCLUDE payloads/extensions/community/PASSFILE/passfile.txt

REM Check if PASSWORD file exists
PASSFILE()

REM If we reach here, PASSWORD file was not found
REM Continue with your attack payload
DELAY 1000
GUI r
DELAY 500
STRINGLN powershell
DELAY 1000
STRINGLN Get-Process
ENTER
```

## Tips

- Place `PASSFILE()` call near the beginning of your payload for maximum protection
- You can change the `#PassFile_PATH` for different check locations
- The extension works silently without user interaction
- If PASSWORD file is found, the Ducky becomes a USB storage device and stops

## Author

- **Author**: Mr.Ender
- **Version**: 1.0
- **Modified**: GreyFA

---

*This extension is part of the Hak5 USB Rubber Ducky community payload collection.*
