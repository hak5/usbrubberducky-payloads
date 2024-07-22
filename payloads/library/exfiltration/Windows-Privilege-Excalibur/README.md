## Windows Privilege Excalibur

<p>
    <a href="https://payloadstudio.hak5.org/community/?device=usb-rubber-ducky&viewurl=https://raw.githubusercontent.com/hak5/usbrubberducky-payloads/master/payloads/library/exfiltration/Windows-Privilege-Excalibur/payload.txt">
        <img alt="VIEW ON: HAK5 PAYLOADSTUDIO" src="https://img.shields.io/badge/VIEW_ON-HAK5_PAYLOADSTUDIO-red?style=for-the-badge">
    </a>
    <a href="#">
        <img alt="TARGET: WINDOWS 10, 11" src="https://img.shields.io/badge/TARGET-WINDOWS_10,_11-blue?style=for-the-badge">
    </a>
    <a href="#">
        <img alt="VERSION: 1.4" src="https://img.shields.io/badge/VERSION-1.4-green?style=for-the-badge">
    </a>
</p>

This payload sends you a brief user privilege escalation report via Dropbox. Once you have the report, you can perform further privilege escalation analysis, including using the following resources:

|Report Category|Useful Resources|
|-|-|
|System Information|[WES-NG](https://github.com/bitsadmin/wesng)|
|User Information|[Priv2Admin](https://github.com/gtworek/Priv2Admin)|
|Stored Credentials||
|Installed Programs|[Exploit Database](https://www.exploit-db.com/) & [Packet Storm](https://packetstormsecurity.com/)|

## Process

1. Detects when the USB Rubber Ducky is ready and whether the target operating system is Windows.
2. Opens a Windows Run dialog box.
3. Executes a hosted PowerShell script that performs the following actions:
- Clears the history of the Windows Run menu.
- Prepares a report on target PC user privilege escalation.
- Sends the report to a file in your Dropbox.

## Prerequisites

First of all, you need to set up an appropriate Dropbox exfiltration "App" to obtain your "app key", "app secret" and "refresh token", which you can do by following the quick tutorial available [here](https://codeberg.org/PlumpyTurkey/Ducky-Utilities/src/branch/main/PowerShell-Functions/Send-ToDropbox). Once you get them, you need to download the "script.ps1" file for this payload and edit it to add the values for your "App". Once you've done that, all you need to do is host the modified file and make it downloadable from a URL that you set as an option for this payload.

> [!WARNING]
> If you're using Dropbox to host your script, make sure the download link for your script ends with "dl=1" and not "dl=0".

## Options

|Required extension options|Extension|Data type|Default value|Description|
|-|-|-|-|-|
|RHP_SCRIPT_URL|Run Hosted PowerShell|String|example.com|Your PowerShell script download link|

## Contributors

- [PlumpyTurkey](https://codeberg.org/PlumpyTurkey)
