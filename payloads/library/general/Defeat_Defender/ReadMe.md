Slightly modified version of the "[Disable Windows Defender](https://github.com/hak5/usbrubberducky-payloads/blob/master/payloads/library/general/Disable_Windows_Defender/payload.txt)" by Zero_Sploit.

Updated by B33m0 to add exception of drive C: to Defender protection, and finally updated by [UberGuidoZ](https://github.com/UberGuidoZ) to fix some UAC and newer Windows version issues.

Description: Opens security settings, disables Defender, then adds an exception of drive C for persistence.<br>
<b>NOTE: Requires local admin privledges</b>

Target: Windows 10/11 (Powershell 2.0 or above)
