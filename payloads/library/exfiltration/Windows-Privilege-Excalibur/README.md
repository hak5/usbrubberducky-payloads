<h1 align="center">
  <a href="https://git.io/typing-svg">
    <img src="https://readme-typing-svg.herokuapp.com/?lines=Windows+Privilege+Excalibur+🪟🗡️">
  </a>
</h1>

## Description

This payload exfiltrates Windows system information, user information (such as privileges), and installed programs from the target computer to Dropbox cloud storage for subsequent privilege escalation analysis. *Only works on Windows 10,11.*

## Usage

### Setup

- **Configure your Dropbox application**

    - Create a Dropbox account.
    - [Create a Dropbox "App"](https://www.dropbox.com/developers/apps/create) with a "Scoped access" API and a "Full Dropbox" access.
    - Go to the settings of this app and write down your "App key" and "App secret".  
    *These are your "<APP_KEY>" and "<APP_SECRET>".*
    - Next, go to the "Permissions" tab and enable the "files.metadata.write" and "files.content.write" permissions.
    - After that, open this link in your browser *(values between brackets must be changed)*.
    ```
    https://www.dropbox.com/oauth2/authorize?client_id=<APP_KEY>&token_access_type=offline&response_type=code
    ```
    - Connect your application, allow its permissions, and note the code it gives you.  
    *This is your "<APP_CODE>".*
    - Open a command prompt and run this command *(values between brackets must be changed)*.
    ```
    curl https://api.dropbox.com/oauth2/token -d code=<APP_CODE> -d grant_type=authorization_code -u <APP_KEY>:<APP_SECRET>
    ```
    - Note the "refresh_token" value of the result.  
    *This is your "<REFRESH_TOKEN>".*

- **Prepare your payload**

    - Download the Powershell script ".ps1".
    - Modify it to include the <APP_KEY>, <APP_SECRET>, and <REFRESH_TOKEN> of your application.
    - Upload your modified ".ps1" file to Dropbox and copy the upload link.
    - Replace the end of the link from "?dl=0" to "?dl=1"  
    *This is your "<DOWNLOAD_LINK>".*
    - Download the "payload.txt" file.
    - Edit it to include your <DOWNLOAD_LINK>.

### Analysis

Once you have your report file, you can easily scan it for vulnerabilities or misconfigurations that would allow you to elevate your privileges on the target system.

You can use a tool such as [WES-NG](https://github.com/bitsadmin/wesng) to look for missing patches on the system.

You can check if the user has dangerous permissions that can be exploited.

The report also contains a list of software installed on the target computer, which allows you to search for exploits that already exist on this software, via sites such as [Exploit Database](https://www.exploit-db.com) or [Packet Storm](https://packetstormsecurity.com).

---

*This script is for educational purposes only. This script is authorized auditing and security analysis purposes only where permitted subject to local and international laws where applicable. Users are solely responsible for compliance with all laws of their locality. This author claims no responsibility for unauthorized or unlawful use.*
