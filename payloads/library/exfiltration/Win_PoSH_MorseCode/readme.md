# :flashlight: Morse Code File Exfiltration
* Author: Cribbit 
* Version: 1.2
* Target: Windows (Powershell 5.1+)
* Category: Exfiltration
* Attackmode: HID & Storage

## :book: Description
Reads all txt files in "my documents" and flashes the scroll lock on and off to represent Morse code of the English alphanumeric characters (0..9 A..Z)
For characters outside the Morse code 0..9 A..Z it now flash one long pulse then the chars ordinal value i.e. (@ = 64 = -.... ....-)

## :musical_note: Note
This is not a very useful payload with limitation of morse code but I thought it was fun to create.

The payload uses a base64 encode version of the payload (b.txt) to get round the Script Execution Policy. There is a non-base64 version in the file (MorseCodeFileExfiltration.ps1) so you can see what it is doing. 

Please check the encoded payload before execution, to make sure it has not been replaced with something more malicious. 

If you do not want to use the base64 version you could change the payload to:
`RUN WIN "powerShell -Noni -NoP -W h -EP Bypass .((gwmi win32_volume -f 'label=''DUCKY''').Name+'payloads\\$SWITCH_POSITION\MorseCodeFileExfiltration.ps1')"`


## :page_facing_up: Change Log
| Version | Changes                       |
| ------- | ------------------------------|
| 1.2     | Ported from BashBunny Repo    |
