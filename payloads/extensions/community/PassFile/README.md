# PassFile - PASSWORD File Detection Extension

This extension checks if a file named "PASSWORD" exists on the target computer. If the file is found (whether hidden or visible), the Rubber Ducky immediately switches to **ATTACKMODE STORAGE** and stops payload execution.

Versions available for:
- **Windows** (passfile.txt)
- **macOS** (passfile_macos.txt)
- **Linux** (passfile_linux.txt)

## Use Case

This extension is useful for:
- **Protecting payload execution** - Prevent the payload from running if a PASSWORD file exists as a safeguard
- **Conditional payload triggering** - Only execute attacks if the PASSWORD file is not present
- **Hidden file detection** - Detects both visible and hidden PASSWORD files across all operating systems

## Target Environment

- **OS**: Windows 10/11, macOS, Linux
- **Requirements**: DuckyScript 3.0+

## Usage

### Windows

Insert at the beginning of your payload:

```DuckyScript
ATTACKMODE HID KEYBOARD

PASSFILE()

REM Your normal payload continues here
DELAY 1000
STRING echo "Payload executed"
ENTER
```

### macOS

```DuckyScript
ATTACKMODE HID KEYBOARD

PASSFILE()

REM Your normal payload continues here
DELAY 1000
STRING echo "Payload executed"
ENTER
```

### Linux

```DuckyScript
ATTACKMODE HID KEYBOARD

PASSFILE()

REM Your normal payload continues here
DELAY 1000
STRING echo "Payload executed"
ENTER
```

## Configuration

### Windows File Path

Modify the `#PassFile_PATH` define:

```DuckyScript
DEFINE #PassFile_PATH C:\Users\Public\PASSWORD
```

**Common Paths:**
- `C:\Users\Public\PASSWORD`
- `C:\Users\USERNAME\Documents\PASSWORD`
- `C:\Users\USERNAME\Downloads\PASSWORD`
- `C:\Users\USERNAME\Desktop\PASSWORD`

### macOS File Path

Modify the `#PassFile_PATH` define:

```DuckyScript
DEFINE #PassFile_PATH /Users/USERNAME/PASSWORD
```

**Common Paths:**
- `/Users/USERNAME/PASSWORD`
- `/Users/USERNAME/Documents/PASSWORD`
- `/Users/USERNAME/Downloads/PASSWORD`
- `/tmp/PASSWORD`

### Linux File Path

Modify the `#PassFile_PATH` define:

```DuckyScript
DEFINE #PassFile_PATH /home/USERNAME/PASSWORD
```

**Common Paths:**
- `/home/USERNAME/PASSWORD`
- `/home/USERNAME/Documents/PASSWORD`
- `/home/USERNAME/Downloads/PASSWORD`
- `/root/PASSWORD`
- `/tmp/PASSWORD`

## How It Works

### Windows
1. Opens Windows Run dialog (`GUI r`)
2. Opens PowerShell in hidden mode (`powershell -W H`)
3. Uses `Test-Path` to check if PASSWORD file exists
4. If found: Switches to `ATTACKMODE STORAGE` and exits
5. If not found: Payload continues normally

### macOS
1. Opens Spotlight (`CMD SPACE`)
2. Opens Terminal (`terminal`)
3. Uses bash `[ -f ]` to check if PASSWORD file exists
4. If found: Switches to `ATTACKMODE STORAGE` and exits
5. If not found: Payload continues normally

### Linux
1. Opens Terminal (`CTRL ALT T`)
2. Uses bash `[ -f ]` to check if PASSWORD file exists
3. If found: Switches to `ATTACKMODE STORAGE` and exits
4. If not found: Payload continues normally

## Hidden File Detection

All versions detect:
- ✅ Visible PASSWORD files
- ✅ Hidden PASSWORD files
- ✅ System PASSWORD files

## Example Payloads

### Windows Example
```DuckyScript
ATTACKMODE HID KEYBOARD

PASSFILE()

REM If we reach here, PASSWORD file was not found
DELAY 1000
GUI r
DELAY 500
STRINGLN powershell
DELAY 1000
STRINGLN Get-Process
ENTER
```

### macOS Example
```DuckyScript
ATTACKMODE HID KEYBOARD

PASSFILE()

REM If we reach here, PASSWORD file was not found
DELAY 1000
CMD SPACE
DELAY 500
STRINGLN terminal
DELAY 1000
STRINGLN ps aux
ENTER
```

### Linux Example
```DuckyScript
ATTACKMODE HID KEYBOARD

PASSFILE()

REM If we reach here, PASSWORD file was not found
DELAY 1000
CTRL ALT T
DELAY 1000
STRINGLN ps aux
ENTER
```

## Tips

- Place `PASSFILE()` call near the beginning of your payload for maximum protection
- You can change the `#PassFile_PATH` for different check locations
- The extension works silently without user interaction
- If PASSWORD file is found, the Ducky becomes a USB storage device and stops
- Customize the file path for your specific use case

## Author

- **Author**: Mr.Ender
- **Version**: 1.0


---

*This extension is part of the Hak5 USB Rubber Ducky community payload collection.*
