# Always Minimize
Minimizing all opened window within specific time/delay. It's a **loop** process, that means this script won't end until you stop it.

## Config
If you want to change the delay, you can change here :

![Delay](https://raw.githubusercontent.com/LyQuid12/usbrubberducky-payloads/master/payloads/library/prank/Always-Minimize/images/delay.PNG)

Default is 2 seconds. 1 Second = 1000 Miliseconds.
If you set a delay less than 1 second, you literally a bastard :]

## How to stop this?
It's simple but hard to do. There's 2 ways to stop/kill this process.

> First way

- Open task manager using <kbd>CTRL</kbd>+<kbd>SHIFT</kbd>+<kbd>ESC</kbd>
- Find `Microsoft (r) Windows Based Script`

![wscript](https://raw.githubusercontent.com/LyQuid12/usbrubberducky-payloads/master/payloads/library/prank/Always-Minimize/images/taskmngr.PNG)

- End the process

> Second way

- Open Command Prompt using <kbd>⊞</kbd>+<kbd>r</kbd> (Windows+r)
- Type `cmd`
- Run this command
```
taskkill /F /IM wscript.exe /T
```
- Enter
