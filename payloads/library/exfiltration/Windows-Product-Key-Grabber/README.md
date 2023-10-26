# Windows Product Key Grabber

<p align="center">
  <a href="https://payloadstudio.hak5.org/community/?device=usb-rubber-ducky&viewurl=https://raw.githubusercontent.com/hak5/usbrubberducky-payloads/master/payloads/library/exfiltration/Windows-Product-Key-Grabber/payload.txt">
    <img alt="View on Payload Studio" src="https://img.shields.io/badge/View_on-Payload_Studio-red?style=flat-square">
  </a>
  <a href="#">
    <img alt="Operating System: Windows 10, 11" src="https://img.shields.io/badge/Operating_System-Windows_10,_11-blue?style=flat-square">
  </a>
  <a href="#">
    <img alt="Category: Exfiltration" src="https://img.shields.io/badge/Category-Exfiltration-purple?style=flat-square">
  </a>
  <a href="#">
    <img alt="Payload: Staged" src="https://img.shields.io/badge/Payload-Staged-yellow?style=flat-square">
  </a>
</p>

This payload sends you the target PC's Windows product key via Dropbox.

<details>
<summary>Extension operation</summary>

1. Detects when the USB Rubber Ducky is ready and whether the target operating system is Windows.
2. Opens a Windows Run dialog box.
3. Executes a hosted PowerShell script that performs the following actions:
- Clears the history of the Windows Run menu.
- Recovers Windows product key from target PC.
- Sends the Windows product key of the target PC to a file in your Dropbox.

</details>


## Prerequisites

First of all, you need to set up an appropriate Dropbox exfiltration "App" to obtain your "app key", "app secret" and "refresh token", which you can do by following the quick tutorial available [here](https://github.com/Who-Is-Julien/Ducky-Utilities/blob/main/PowerShell-Functions/Send-ToDropbox/README.md).
Once you've obtained them, you need to download the "script.ps1" file from this payload and modify it to add your "App" values. Once you've done that, all you have to do is host the modified file and make it downloadable from a url you define as an option to this payload.

> Note: If you're using Dropbox to host your script, make sure the download link for your script ends with "dl=1" and not "dl=0".


## Options

|Required extension options|Extension|Data type|Default value|Description|
|-|-|-|-|-|
|RHP_SCRIPT_URL|Run Hosted PowerShell|String|example.com|Your PowerShell script download link|


## Authors

- [@Who-Is-Julien](https://github.com/Who-Is-Julien)
