## About:
* Title: DuckyLogger
* Description: Key logger which sends each and every key stroke of target remotely/locally.
* AUTHOR: drapl0n
* Version: 1.0
* Category: Credentials
* Target: Unix-like operating systems with systemd.
* Attackmodes: HID

## DuckyLogger: DuckyLogger is a Key Logger which captures every key stroke of traget and send them to attacker.

### Features:
* Live keystroke capturing.
* Detailed key logs.
* Persistent
* Autostart payload on boot.

### Workflow:
* Encoding payload and injecting on target's system.
* Checks whether internet is connected to the target system. 
* If internet is connected then it sends raw keystrokes to attacker. 
* Attacker processes raw keystrokes. 

### Changes to be made in payload:
* Replace ip(0.0.0.0) and port number(4444) with your servers ip address and port number on line no `43`.
* Increase/Decrease time interval to restart service periodically (Default is 15 mins), on line no `59`.

### Usage:
1. Encode payload.txt and inject into target's system.
2. Start netcat listner on attacking system:

* `nc -lvp <port number> > <log filename>` use this command to create new logfile with raw keystrokes.
* `nc -lvp <port number> >> <log filename>` use this command to append raw keystrokes to existing logfile.
3. Process raw keystrokes using DuckyLoggerDecoder utility:
```
./duckyLoggerDecoder
DuckyLoggerDecoder is used to decode raw key strokes acquired by duckyLogger.

Usage: 
Decode captured log:    [./duckyLoggerDecoder -f <Logfile> -m <mode> -o <output file>]

Options:
-f      Specify Log file.
-m      Select Mode(normal|informative)
-o      Specify Output file.
-h      For this banner.
```

#### Support me if you like my work:
* https://twitter.com/drapl0n
