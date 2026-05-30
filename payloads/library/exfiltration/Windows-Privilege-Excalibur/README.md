# Windows Privilege Excalibur

<p>
    <a href="https://payloadstudio.hak5.org/community/?device=usb-rubber-ducky&viewurl=https://raw.githubusercontent.com/hak5/usbrubberducky-payloads/master/payloads/library/exfiltration/Windows-Privilege-Excalibur/payload.txt">
        <img alt="VIEW ON: HAK5 PAYLOADSTUDIO" src="https://img.shields.io/badge/VIEW_ON-HAK5_PAYLOADSTUDIO-red?style=for-the-badge">
    </a>
    <a href="#">
        <img alt="TARGET: WINDOWS 10, 11" src="https://img.shields.io/badge/TARGET-WINDOWS_10,_11-blue?style=for-the-badge">
    </a>
    <a href="#">
        <img alt="VERSION: 1.5" src="https://img.shields.io/badge/VERSION-1.5-green?style=for-the-badge">
    </a>
</p>

This payload sends you a brief user privilege escalation report via Dropbox.

| Report section     | Useful resources                                                                                   |
|--------------------|----------------------------------------------------------------------------------------------------|
| System information | [WES-NG](https://github.com/bitsadmin/wesng)                                                       |
| User information   | [Priv2Admin](https://github.com/gtworek/Priv2Admin)                                                |
| Stored credentials |                                                                                                    |
| Installed programs | [Exploit Database](https://www.exploit-db.com/) & [Packet Storm](https://packetstormsecurity.com/) |

## Process

1. Detects when the USB Rubber Ducky is ready and whether the target operating system is Windows.
2. Opens PowerShell from the Windows quick link menu (Win+X).
3. Collects system, user, credential, and installed program information.
4. Exfiltrates the report to your Dropbox using
   the [PowerShell To Dropbox](https://codeberg.org/PlumpyTurkey/Ducky-Utilities/src/branch/main/Extensions/PowerShell-To-Dropbox)
   extension.
5. Clears the PowerShell command history and exits the session.
6. Disables the USB Rubber Ducky when `DISABLE_AFTER_EXECUTION` is enabled.

## Prerequisites

Configure a Dropbox app and set `PTD_REFRESH_TOKEN`, `PTD_APP_KEY`, and `PTD_APP_SECRET` in
`payload.txt`. See
the [PowerShell To Dropbox](https://codeberg.org/PlumpyTurkey/Ducky-Utilities/src/branch/main/Extensions/PowerShell-To-Dropbox)
README for setup instructions.

## Options

### [PowerShell To Dropbox](https://codeberg.org/PlumpyTurkey/Ducky-Utilities/src/branch/main/Extensions/PowerShell-To-Dropbox) - Required

| Option              | Type   | Default                                                            | Description                  |
|---------------------|--------|--------------------------------------------------------------------|------------------------------|
| `PTD_REFRESH_TOKEN` | String | `XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX` | Your Dropbox `refresh_token` |
| `PTD_APP_KEY`       | String | `XXXXXXXXXXXXXXX`                                                  | Your Dropbox `APP_KEY`       |
| `PTD_APP_SECRET`    | String | `XXXXXXXXXXXXXXX`                                                  | Your Dropbox `APP_SECRET`    |

### Advanced payload options

| Option                    | Type    | Default | Description                                   |
|---------------------------|---------|---------|-----------------------------------------------|
| `SHORT_DELAY`             | Integer | `500`   | Short delay (ms)                              |
| `MEDIUM_DELAY`            | Integer | `2000`  | Medium delay (ms)                             |
| `DISABLE_AFTER_EXECUTION` | Boolean | `TRUE`  | Disables the USB Rubber Ducky after execution |

## Contributors

- [PlumpyTurkey](https://codeberg.org/PlumpyTurkey)
