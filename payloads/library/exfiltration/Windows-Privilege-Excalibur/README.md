<h1 align="center">
  <a href="https://git.io/typing-svg">
    <img src="https://readme-typing-svg.herokuapp.com/?lines=Windows+Privilege+Excalibur+🪟🗡️">
  </a>
</h1>

## Description

This payload exfiltrates Windows system information, user information, stored credentials and installed programs from the target computer to Dropbox for subsequent privilege escalation analysis. *Only works on Windows 10,11.*

*The setup needs to be done only once for the payload to work forever.*

## Setup

> If you already have your <APP_KEY>, <APP_SECRET> and <REFRESH_TOKEN>, you can go directly to the "Prepare your payload" step.

- **Configure your Dropbox application** 
 
    - Follow the instructions in "[DROPBOXSETUP.md](https://github.com/hak5/usbrubberducky-payloads/blob/master/payloads/library/exfiltration/Windows-Privilege-Excalibur/DROPBOXSETUP.md)".

- **Prepare your payload**

    - Download the Powershell script "script.ps1".
    - Modify it to include the <APP_KEY>, <APP_SECRET>, and <REFRESH_TOKEN> of your application.
    - Upload your modified "script.ps1" file to Dropbox and copy the upload link.
    - Replace the end of the link from "?dl=0" to "?dl=1"  
    *This is your "<DOWNLOAD_LINK>".*
    - Download the "payload.txt" file.
    - Edit it to include your <DOWNLOAD_LINK>.

## Analysis

Once you have your report file, you can use the following resources to help you find ways to escalate your privileges:

| Report Category | Useful Resources |
| --- | --- |
| System Information | [WES-NG](https://github.com/bitsadmin/wesng)  |
| User Information | [Priv2Admin](https://github.com/gtworek/Priv2Admin) |
| Stored Credentials | |
| Installed Programs | [Exploit Database](https://www.exploit-db.com) & [Packet Storm](https://packetstormsecurity.com) |

#### Coming soon...

- [ ] Windows Services Misconfigurations

---

*This script is for educational purposes only. This script is authorized auditing and security analysis purposes only where permitted subject to local and international laws where applicable. Users are solely responsible for compliance with all laws of their locality. This author claims no responsibility for unauthorized or unlawful use.*
