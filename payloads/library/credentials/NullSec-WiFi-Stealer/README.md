# NullSec WiFi Stealer 📡

Extracts saved WiFi passwords from Windows machines using netsh commands.

**Category**: Credentials

## Description

This payload extracts all saved WiFi network passwords from a Windows 10/11 machine. It uses the built-in `netsh` command to enumerate wireless profiles and retrieve their stored keys.

## Features

- ✅ Extracts all saved WiFi profiles
- ✅ Retrieves passwords in cleartext
- ✅ Runs hidden (no visible window)
- ✅ Self-cleaning (removes temp files)
- ✅ Optional webhook exfiltration

## Getting Started

### Dependencies

* Windows 10/11
* PowerShell (default on Windows)
* WiFi adapter with saved networks

### Settings

Modify the payload to add your exfil server:
1. Uncomment the webhook lines
2. Replace `example.com/hook` with your server

### Execution Time

~5-10 seconds depending on number of saved networks

## Target

Windows 10/11

## Credits

<h2 align="center"> bad-antics </h2>
<div align=center>
<table>
  <tr>
    <td align="center" width="96">
      <a href="https://github.com/bad-antics">
        <img src="https://github.com/bad-antics.png" width="48" height="48" />
      </a>
      <br>GitHub
    </td>
  </tr>
</table>
</div>
