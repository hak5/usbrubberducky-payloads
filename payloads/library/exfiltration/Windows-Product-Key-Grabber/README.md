# Windows Product Key Grabber

This payload sends you the target PC's Windows product key via Dropbox.

<details>
<summary>Extension operation</summary>

1. Opens a Windows Run dialog box.
2. Executes a hosted PowerShell script that performs the following actions:
- Clears the history of the Windows Run menu.
- Recovers Windows product key from target PC.
- Sends the Windows product key of the target PC to a file in your Dropbox.
3. *Disables USB rubber ducky.*

</details>


## Prerequisites

First of all, you need to set up an appropriate Dropbox exfiltration "App" to obtain your "app key", "app secret" and "refresh token", which you can do by following the quick tutorial available [here](https://github.com/Who-Is-Julien/Ducky-Utilities/blob/main/PowerShell-Functions/Send-ToDropbox/README.md).
Once you've obtained them, you need to download the "script.ps1" file from this payload and modify it to add your "App" values. Once you've done that, all you have to do is host the modified file and make it downloadable from a url you define as an option to this payload.

> Note: If you're using Dropbox to host your script, make sure the download link for your script ends with "dl=1" and not "dl=0".


## Options

|Required options|Data type|Default value|Description|
|-|-|-|-|
|SCRIPT_URL|String|example.com|Your PowerShell script download link|

|Advanced options|Data type|Default value|Description|
|-|-|-|-|
|ACTIVE_DETECTION|Boolean|FALSE|Detects if the USB Rubber Ducky is ready using CAPSLOCK reflection (if set to "FALSE", it detects using the current operating system lock key reflection state)|
|DETECTION_MAX_TRIES|Integer|200|Maximum number of detection attempts|
|DETECTION_CHECK_INTERVAL|Integer|20|The interval between each detection attempt|
|SHORT_DELAY|Integer|500|Short delay time|
|MEDIUM_DELAY|Integer|2000|Medium delay time|
|ELEVATED_EXECUTION|Boolean|FALSE|Runs your script with administrator rights|
|DISABLE_AFTER_EXECUTION|Boolean|TRUE|Disables USB Rubber Ducky after extension execution|


## Authors

- [@Who-Is-Julien](https://github.com/Who-Is-Julien)
