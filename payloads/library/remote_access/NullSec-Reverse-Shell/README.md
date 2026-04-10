# NullSec Reverse Shell 🐚

PowerShell-based reverse shell for Windows.

**Category**: Remote Access

## Description

Establishes a reverse TCP connection back to an attacker-controlled machine, providing an interactive PowerShell session.

## Features

- ✅ Pure PowerShell (no additional tools)
- ✅ Runs hidden (no visible window)
- ✅ Interactive shell with PS prompt
- ✅ Bypasses execution policy

## Getting Started

### Dependencies

* Windows 10/11
* Network connectivity to attacker
* Netcat/ncat listener on attacker machine

### Settings

1. Set `ATTACKER_IP` to your listener IP
2. Set `ATTACKER_PORT` to your listener port

### Attacker Setup

Start a listener before executing:
```bash
nc -lvnp 4444
```

### Execution Time

~3 seconds to connect

## Target

Windows 10/11

## ⚠️ Disclaimer

For authorized penetration testing only. Never use without explicit permission.

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
