## About:
* Title: Browser-Passwords-Dropbox-Exfiltration
* Description: Opens PowerShell hidden, grabs Chrome passwords, saves as a cleartext file and exfiltrates info via Dropbox.
* Then it cleans up traces of what you have done after.
* AUTHOR: DIYS.py
* Version: 1.0
* Category: Credentials, Exfiltration
* Target: Windows 10
* Attackmodes: HID

### Features:
* Reasonably stelathy
* Fairly quick

### Workflow:
* Encoding payload and injecting on target's system.
* Checks Chrome files and obtains the stored browser credentials
* Saves a plaintext file of all of the usernames, passwords, websites 
* Deletes the Temp files, recycle bin, Run and PowerShell history

### Usage Version 01:
1. Follow the instructions on the link enclosed in the PowerShell script to create the correct API access credentials for your Dropbox account.
2. Obtain your Authentication Token and add it to the PowerShell script, upload that script to your dropbox and add the link to it in the payload file.
3. Encode payload.txt and inject into target's system.
4. Check your Dropbox for the files.

### Possible Issues:
1. AVG detected this was trying to access Chrome info and blocked it from working some of the time.

DIYSpy on Twitter
