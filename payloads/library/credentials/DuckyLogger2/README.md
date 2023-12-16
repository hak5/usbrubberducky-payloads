## About:
* Title: DuckyLogger 2.0
* Description: Keylogger, which sends each and every keystroke of the target remotely/locally.
* AUTHOR: drapl0n
* Version: 2.0
* Category: Credentials.
* Target: Unix-like operating systems with systemd.
* Attackmodes: HID.

## DuckyLogger 2.0 is the most efficient version of the original DuckyLogger, which captures every keystroke of the traget and sends it back to the attacker.

### Features:
* Live keystroke capturing.
* Detailed key logs.
* Persistent.
* Autostart payload on boot.

### What's new ?
* No trigger from the target's end is required.
* Completely autostarts the payload on boot.
* Removed unnecessary script blocks.
* No need to run two different services.

### Workflow:
* Encoding payload and injecting it into the target's system.
* Checks whether the internet is connected to the target system.
* If the internet is connected, then it sends raw keystrokes to the attacker. 
* Attacker processes raw keystrokes.

### Changes to be made in payload:
* Replace ip (0.0.0.0) and port number (4444) with your server's ip address and port number on line no. `43`.
* Increase/Decrease time interval to restart service periodically (default is 5 minutes), on line no. `59`.

### Usage:
1. Encode payload.txt and inject it into the target's system.
2. Start Netcat listner on the attacking system:

* `nc -lvp <port number> > <log filename>` use this command to create new a logfile with raw keystrokes.
* `nc -lvp <port number> >> <log filename>` use this command to append raw keystrokes to an existing log file.
3. Process raw keystrokes using the DuckyLoggerDecoder utility:
```
./duckyLoggerDecoder
DuckyLoggerDecoder is used to decode raw key strokes acquired by duckyLogger.

Usage: 
Decode captured log:    [./duckyLoggerDecoder -f <Logfile> -m <mode> -o <output file>]

Options:
-f      Specify the log file.
-m      Select Mode(normal|informative)
-o      Specify an output file.
-h      For this banner.
```

#### Support me if you like my work:
* https://twitter.com/drapl0n
