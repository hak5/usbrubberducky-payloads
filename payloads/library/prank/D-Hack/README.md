# D-Hack Prank
#### by: Hackgotchi🪼

>A retro movie-style computer being hacked prank for the Hak5 USB Rubber Ducky.

This harmless Windows prank uses the USB Rubber Ducky's **HID** and **STORAGE** modes to launch a hidden PowerShell script from the Ducky's storage partition.

 the script displays randomized fake security alerts, animated loading bars, warning messages, system sounds, colors, icons, and oversized emojis at different positions across the screen.

The computer is **not actually hacked**. The payload does not collect credentials, steal information, download external files, or modify system settings. When the prank ends, all remaining popup jobs are stopped and a final message reveals that the user has been pranked.


## Target

- Windows 10
- Windows 11

## Required Files

Place these files in the root of the Rubber Ducky storage partition:

```text
payload.txt
run_hidden.vbs
prank.ps1
```

Your Ducky storage should look like this:

```text
DUCKY/
├── payload.txt
├── prank.ps1
└── run_hidden.vbs
```

The storage partition must be labeled:

```text
DUCKY
```

> [!IMPORTANT]
> The PowerShell file must be named exactly `prank.ps1` and saved using **UTF-8-BOM** encoding so emojis and special characters display correctly.

## How It Works

1. The Rubber Ducky starts in HID and storage mode.
2. It opens the Windows Run dialog.
3. PowerShell searches for a mounted drive labeled `DUCKY`.
4. The payload launches `run_hidden.vbs` from that drive.
5. The VBScript starts `prank.ps1` with no visible PowerShell window.
6. The fake hacking effects run for approximately 30 or to what ever you set it to seconds.
7. All popup jobs are cleaned up and the prank is revealed.


```
### Main `prank.ps1` Settings

The main prank settings are located near the beginning of `prank.ps1`:

```powershell
$duration = 30
$interval = 2
$popupsPerCycle = 6
$maxActiveJobs = 12

# Sound settings
$enableSounds = $true
$soundChancePercent = 100
```

## Customization

You can customize the prank directly inside `prank.ps1`.

### Duration and Popup Count

```powershell
$duration = 30
$interval = 2
$popupsPerCycle = 6
$maxActiveJobs = 12
```

- `$duration` — total prank duration in seconds
- `$interval` — delay between popup cycles
- `$popupsPerCycle` — number of popups created during each cycle
- `$maxActiveJobs` — maximum number of popup jobs allowed at once

> [!WARNING]
> Increasing the popup count or reducing the interval may use more system resources.

### Fake Loading Messages

```powershell
$loadingPhrases = @(
    "BYPASSING FIREWALL...",
    "BREACH IN PROGRESS...",
    "INSTALLING VIRUS...",
    "DOWNLOADING DATA..."
)
```

Add, remove, or replace any message inside the array.

### Fake Alert Messages

```powershell
$alertPhrases = @(
    "HACKED",
    "VIRUS DETECTED",
    "SYSTEM COMPROMISED",
    "ALERT",
    "SECURITY ALERT: DATA AT RISK",
    "CRITICAL SECURITY BREACH",
    "YOUR IP HAS BEEN EXPOSED",
    "WARNING: UNAUTHORIZED ACCESS DETECTED",
    "MALICIOUS ACTIVITY DETECTED"
)
```

### Emojis

```powershell
$emojis = @(
    "💀",
    "🪼",
    "🐱"
)
```

Remember to keep `prank.ps1` saved as **UTF-8 with BOM** when using emojis.

### Popup Colors

```powershell
$colors = @(
    "GreenYellow",
    "Black",
    "HotPink"
)
```

The values must be valid .NET `System.Drawing.Color` names.

### Window Icons

```powershell
$icons = @(
    "Information",
    "Warning",
    "Error"
)
```

### System Sounds

```powershell
$enableSounds = $true
$soundChancePercent = 100

$sounds = @(
    "Asterisk",
    "Beep",
    "Exclamation",
    "Hand",
    "Question"
)
```

Set `$enableSounds` to `$false` to disable sounds.

Use `$soundChancePercent` to control how often a popup plays a sound:

```powershell
$soundChancePercent = 50
```

### Progress-Bar Style

```powershell
$progressBar.Style = "Continuous"
```

Available styles include:

```powershell
$progressBar.Style = "Blocks"
$progressBar.Style = "Continuous"
$progressBar.Style = "Marquee"
```

- `Blocks` — segmented progress bar
- `Continuous` — smooth progress bar
- `Marquee` — moving animation without a fixed percentage

## Features

- Retro movie-style fake hacking experience
- Runs PowerShell with no visible console window
- Automatically detects the Ducky storage drive
- Works regardless of the assigned drive letter
- Random fake security-alert windows
- Animated fake hacking loading bars
- Random colors, icons, messages, emojis, and sounds
- Customizable duration and popup frequency
- Limits the number of simultaneous popup jobs
- Automatically cleans up PowerShell jobs
- Ends with a clear prank reveal


## Troubleshooting

### Nothing Happens

Confirm that:

- The storage partition is labeled `DUCKY`
- All three files are in the root of the storage partition
- The filenames exactly match the required names
- `prank.ps1` must be is saved as **UTF-8 with BOM Encoding**
- Windows PowerShell and Windows Script Host are available
- The Ducky payload compiled successfully

### Emojis Display Incorrectly

Open `prank.ps1` in a text editor and save as:

```text
UTF-8-BOM
```

In notepad/text editor, click file > save as > at the bottom change UTF-8 to **UTF-8 with BOM**


## Disclaimer

This payload is intended only as a harmless fake hacking prank on systems you own or have explicit permission to test.

Do not use it on another person's device without their knowledge and permission. The author is not responsible for misuse, disruption, data loss, or damage caused by unauthorized use.
