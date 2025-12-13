<div align="center">
  
# PlunderPIN

</div>

**Title:** PlunderPIN

**Author:** [OSINTI4L](https://github.com/OSINTI4L)

**Target Os:** Android mobile device/Google Chrome (tested on Samsung S24 FE | One UI V8.0 | Android 16 | Google Chrome browser 143.0.7499.53)

## What is PlunderPIN?

PlunderPIN is a DuckyScript phishing payload designed to trick a user into entering their mobile lockscreen PIN which is then logged in the `access.log` file of an Apache webserver. This is done so that an attacker can use the phished PIN for futher attacks against the mobile device, as they can now defeat the lockscreen and have total access as well as utilize the PIN for other authentication required applications and services. For testing pruposes the webserver will be hosted over LAN (both the attacker machine and target device must be on the same LAN)., but can easily be hosted over the internet.

### How it works

An attacker will host a malicious Google homepage (homepage.html) clone on an Apache webserver. The malicious homepage will be injected via Hak5 USB RubberDucky or O.mg device to the target mobile device. Once injected it will configure the homepage in the Google Chrome browser user settings so that the default homepage is now "swapped" with the malicious homepage. When a user now opens the Google Chrome browser they will be displayed with the malicious homepage and be prompted with a phishing mechanism (fake "update") to capture the mobile device lockscreen PIN. The PIN will then be stored in the `access.log` file of the Apache webserver hosting the malicious homepage.

### The homepage.html
  - Features:
    - Dark and Light mode variations that will render according to device settings.
    - A useable search bar and buttons that will forward the user input as a Google search request so that the homepage appears authentic.
    - Persistently stored in browser settings (survives browser closing, device reboot, etc).
    - Cookie mechanism to ensure that PIN is entered.
> The cookie mechanism helps the homepage appear authentic. A user is *required* to tap the initial "update" button prompt to continue the phishing scheme; they are unable to ignore it and continue using the browser. When a user enters their PIN a cookie is stored inside of the browser (for a period of 1 year) "telling" the homepage when loaded that a PIN has previously been entered. As the homepage is persistently configured in the user settings, it would be highly suspicious for a user to be prompted for updates/PIN every time they open the browser to the homepage. To circumvent this the cookie mechanism was implemented. If cookies are cleared the user will be prompted for the PIN again.

![DM](https://github.com/user-attachments/assets/3a776008-0b27-475b-b9ca-809eaa5928b2)
![LM](https://github.com/user-attachments/assets/dfbc4161-f62e-45b8-922b-9d4ab73282f2)

-----

### payload.txt
The payload.txt file is the delivery system for configuration of the Google Chrome browser and can be injected with a Hak5 USB RubberDucky or O.mg device.

**The URL pointing to the Apache webserver must be defined in line 7 of the payload.txt.** The URL to the webserver is the following: `http://x.x.x.x:/homepage.html`. Replace the IP parameter with the IP address of the attacker machine (explained in setting up Apache webserver section below). E.g., `http://192.168.8.100/homepage.html`.

An additional layer of obfuscation can be had by utilizing a URL shortening service (e.g., [Tinyurl](https://tinyurl.com/)). After placing the `http://x.x.x.x/homepage.html` URL into the shortener, you will then use the shortened URL as the constant defined in line 7.

The payload workflow is as follows:
  - Chrome browser is opened.
  - A new tab is opened to ensure the proper browser environment is present for the script to run without issues.
  - The browser is then navigated to the settings menu where the malicious Apache webserver URL is placed.
  - All tabs are then closed.
  - All applications are then closed and the phone returns to the home screen. This is necessary for obfuscation purposes and to allow the browser to automatically navigate to the malicious homepage when opened.

-----

### Viewing logs/target PIN

The target's PIN will be logged in the Apache webserver `/var/log/apache2/access.log` file.

This can be read at anytime via: `cat /var/log/apache2/access.log`

<img width="889" height="254" alt="alog" src="https://github.com/user-attachments/assets/fc90870a-b106-4324-80e3-0463b69603e3" />

-----

### Setting up the Apache webserver using a [Kali Linux](https://www.kali.org) box
1. Once you have spun-up an instance of Kali (our attacker machine), you must first find the IP address of the machine. This can be found via `ifconfig`, store the IP address as it will be used as the URL to inject to the target mobile device (see payload.txt section above).
     
2. Download the homepage.html file from the PlunderPIN repository directory. This will be the homepage that our malicious URL will point to.

3. Move the homepage.html file (downloaded to your current working directory) to the Apache webserver:
    - `sudo mv homepage.html /var/www/html`

4. Start the Apache webserver:
    - `sudo systemctl start apache2`

-----

### Cleanup
Two artifacts are left by the payload:
  1. Google Chrome homgepage settings.
     - To remove: Open Chrome > Settings Menu > Settings > Homepage > Remove Apache URL
      
  2. Cookie for phishing mechanism.
     - To remove: Open Chrome > Settings Menu > Privacy and Security > Delete browsing data
