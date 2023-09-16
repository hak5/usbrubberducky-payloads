# Windows Product Key Grabber

This payload sends you the target PC's Windows product key via Dropbox.

<details>
<summary>Extension operation</summary>

1. Detects when the USB Rubber Ducky is ready and whether the target operating system is Windows.
2. Opens a Windows Run dialog box.
3. Executes a hosted PowerShell script that performs the following actions:
- Clears the history of the Windows Run menu.
- Recovers Windows product key from target PC.
- Sends the Windows product key of the target PC to a file in your Dropbox.
4. *Disables USB Rubber Ducky.*

</details>


## Prerequisites

First of all, you need to set up an appropriate Dropbox exfiltration "App" to obtain your "app key", "app secret" and "refresh token", which you can do by following the quick tutorial available [here](https://github.com/Who-Is-Julien/Ducky-Utilities/blob/main/PowerShell-Functions/Send-ToDropbox/README.md).
Once you've obtained them, you need to download the "script.ps1" file from this payload and modify it to add your "App" values. Once you've done that, all you have to do is host the modified file and make it downloadable from a url you define as an option to this payload.

> Note: If you're using Dropbox to host your script, make sure the download link for your script ends with "dl=1" and not "dl=0".


## Options

|Required options|Data type|Default value|Description|
|-|-|-|-|
|SCRIPT_URL|String|example.com|Your PowerShell script download link|

You can find the advanced options documentation directly in the [Run Hosted PowerShell](https://github.com/Who-Is-Julien/Ducky-Utilities/blob/main/Extensions/Run_Hosted_PowerShell/README.md) extension documentation.


## Authors

- [@Who-Is-Julien](https://github.com/Who-Is-Julien)
