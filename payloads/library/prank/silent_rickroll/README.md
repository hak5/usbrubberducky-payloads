# Silent Roll
***

This script does the following actions respectively

+ Raises volume to maximum
+ Creates Batch file
+ Runs Batch file
***

## Description
The script was thought in a way that the payload could be executed in machines that have some level of protection and wont allow the user to open Run Dialog or CMD straight away

Setting the volume to maximum is used with keystroke injection.

The Batch file created (see bellow) executes itself on a minimized window by default, the first delay specifies how long the batch file will take to execute the rest of the code.
Following the first line of code which starts playing "Never Gonna Give You Up" using whichever default browser the user has, there is another delay simply to allow that the video will play automatically before another window is open.
The last line of code opens powershell and executes commands to open Microsoft Edge, since it is a browser that is always present on Windows and would help in preventing the user to end the rickroll easily.
Edge will open a page which leads to a windows fake update page, which will also be set to full screen using powershell commands.

```console
if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "" /min "%~dpnx0" %* && exit
TIMEOUT /T 10
START "" https://www.youtube.com/watch?v=xm3YgoEiEDc
TIMEOUT /T 3
Powershell -command "$wshell = New-Object -ComObject wscript.shell;[system.Diagnostics.Process]::Start(\"msedge\",\"about:blank\");Sleep 1;$wshell.SendKeys('^"{l}"');Sleep 1;$wshell.SendKeys('https://fakeupdate.net/win10ue/');$wshell.SendKeys('"{Enter}"');$wshell.SendKeys('"{F11}"')"
exit
```

The rest of the script then saves the Batch file to the Documents folder, away from a user's immediate view. Sadly this part of the script encountered problems using the REPEAT function in which "TAB REPEAT 8" did not work as intended and the script always got stuck to File Explorer's search bar, never being able to select the folder and save the file properly so "REPEAT" had to be removed in this instance

The batch file's name is then searched and executed, the delay can give the attacker enough time to remove the device from the machine and be far away before it executes

***
[Ducktoolkit][1] utilized to encode scripts

### [Hak5 Ducky script references][2]

[1]: https://ducktoolkit.com/encode
[2]: https://docs.hak5.org/usb-rubber-ducky-1/the-ducky-script-language/ducky-script-quick-reference
