Funni Stick V3 is the third generation of Maker Inc. Funni Stick Products.
Steal Windows Passwords in 30 Seconds (or less)!

It runs on the same core principle as the "Simple_User_Password_Grabber" by makozort (https://github.com/makozort thank you makozort!)
This time using the Twin Duck Firmware on the Rubber-Ducky and a couple of optimiziations it's just the slightest bit faster + it doesnt require Internet access to work potentailly bypassing any firewall/network restrictions.
One less Dependancy is always good.

For this to work youll need 2 things saved on the Rubber ducky
1. The Funni_Stick_V3 Script (in inject.bin format)
2. mimikatz.exe renamed to pw.exe (if you really want to you can change this if you adjust the Funni_Stick_V3 script)

Users and Password(hashes) will be saved back onto the stick named after the Username of the machine it was run on for easy identification.(slick right?)
It is recommended that you pull out the Ducky after everything is done asap because windows defender might delete your copy of mimikatz.exe
I tried to be fancy and include a powershell command that automatically ejects the drive. But when i tested it on another USB, the ejection did work, but now i cant plug them back in. Ive bricked 3 USB Sticks this way. Feel free to yell a soloution my way.
