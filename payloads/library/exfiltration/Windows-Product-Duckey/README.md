<h1 align="center">
  <a href="https://git.io/typing-svg">
    <img src="https://readme-typing-svg.herokuapp.com/?lines=Windows+Product+Duckey+🦆🔑">
  </a>
</h1>

## Description

This payload exfiltrate the target's Windows product key to a remote server. *Only works on Windows 10,11.*

## Usage

### Setup

- Set up a website on your server or a computer in the same network as the target's computer. You can use Python to do this by running the following command:
```
python -m http.server 80
```
- Download the "payload.txt" and "script.ps1" files and modify them to include the IP address of your server.
- Move the modified "script.ps1" file to the root directory of your website, so it is downloadable from this address:
```
http://<REMOTE_IP_ADDRESS>/script.ps1
```

### Analysis

Once the payload is executed, you can find the target's IP address and Windows product key by checking your website logs.


***Note**: This script is designed to send the results to a specific server, so you don't have to rely on any file sharing services. Additionally, you can easily adapt it to work with encrypted sites.*

---

*This script is for educational purposes only. This script is authorized auditing and security analysis purposes only where permitted subject to local and international laws where applicable. Users are solely responsible for compliance with all laws of their locality. This author claims no responsibility for unauthorized or unlawful use.*
