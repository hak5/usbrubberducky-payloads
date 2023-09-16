## Windows Privilege Excalibur

This payload sends you a brief privilege escalation report of the target PC user via Dropbox. Once you have the report, you can perform further privilege escalation analysis, including using the following resources:

| Report Category | Useful Resources |
| --- | --- |
| System Information | [WES-NG](https://github.com/bitsadmin/wesng)  |
| User Information | [Priv2Admin](https://github.com/gtworek/Priv2Admin) |
| Stored Credentials | |
| Installed Programs | [Exploit Database](https://www.exploit-db.com) & [Packet Storm](https://packetstormsecurity.com) |

<details>
<summary>Extension operation</summary>

1. Detects when the USB Rubber Ducky is ready and whether the target operating system is Windows.
2. Opens a Windows Run dialog box.
3. Executes a hosted PowerShell script that performs the following actions:
- Clears the history of the Windows Run menu.
- Prepares a report on target PC user privilege escalation.
- Sends the report to a file in your Dropbox.
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
