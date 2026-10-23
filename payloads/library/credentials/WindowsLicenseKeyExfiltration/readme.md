**Title: WindowsLicenseKeyExfiltration**

<p>Author: 0i41E<br>
OS: Windows<br>
Version: 1.0<br>

**What is WindowsLicenseKeyExfiltration?**

#
<p>This payload exfiltrates the Windows Product keys from the target system. These can be saved in the registry and/or on the BIOS itself. Sometimes they can differ.

This may be an important process for Admins or for your private use.</p>


**Instructions:**
1. By default, the keys will get exfiltrated via Keystroke Reflection, which may take a while but does not require any form of internet connection or mass stoarge to be allowed. If you set `REMOTE_EXFIL` in line 132 to `TRUE`, then you'll need to define the address of the receiving remote host, this either can be an URL of a webhook or an IP_Address of a system of your choice. Define it in line 134.

2. Plug in your RubberDucky into a Windows target and wait for the process to end.

_*If plugged into a non Windows system, `ATTACKMODE STORAGE` will be triggered. This way you can collect the loot savely._

3. Open the exfiltrated loot.bin file to access the recovered key, or check your remote host for received messages.