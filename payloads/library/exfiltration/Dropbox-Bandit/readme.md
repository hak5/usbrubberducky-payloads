
# **Dropbox Bandit**
This payload is designed to target Windows 10/11 machines, but but may run on older versions of Windows. If you are using an older Rubber Ducky please use the "payload_duckyscript_old.txt" file.

This payload extracts files from a specific location on a target's machine and uploads them in archives to a dropbox account. The actual payload takes about 5 seconds to run (faster on real machines, tested on virtual machine), but the actual exfiltration, which is invisible to the victim once started, can take longer depending on the total size of data to be uploaded. 

**Configuration:**
- Selects a folder (and thereby all subfolders) to extract files from
- Select filetype(s) or filename(s) to target
- Dropbox account to use

**Payload Anatomy:**
- The payload runs a hidden and windowless powershell window which then downloads and executes the powershell script from a url.
- The powershell script finds all the files that match the chosen parameters and copies them to a directory in %temp%\cpy\0
- Once the amount of files in the temporary directory exceeds 100mb, close to the dropbox upload size limit, the script creates a new subdirectory
- The script obtains a token from the dropbox api to be used for uploading later, using the refresh_token (see info on how to get this token below)
- The script archives each of our subdirectories into zip files in %temp%, named like this: `${USERNAME}-${MM-dd-yyyy}-${HH-MM-ss}.zip`
- The script uploads each zip file to this folder on your dropbox account: `${hostname}-{USERNAME}/${MM-dd-yyyy}/`
- The script deletes the zip files and temporary directory
- The script deletes local powershell history and logs
- Script exits

## **Setup**
- Create a new Dropbox account
- [Create a new "App"](https://www.dropbox.com/developers/apps/create)
-- Select "Scoped Access"
-- Select "Full Dropbox"
-- Name it whatever you want
-- Go the the "Permissions" tab and enable "files.content.write", and "files.metadata.write"
-- Go to the "Settings" tab and copy your "App key" and "App secret"
-- Go to the "Settings" tab -> OAuth 2 -> Generated Access token and copy the token that you generate. **Important: This token will expire in 4 hours**, so you will only use this one to get your refresh token
-- Enter this link in your browser: https://www.dropbox.com/oauth2/authorize?client_id=YOUR_APP_KEY_GOES_HERE&token_access_type=offline&response_type=code, but ensure you replace "YOUR_APP_KEY_GOES_HERE" with your app key from above
* Click "Continue" and "Allow" and then copy the token it gives you. 
* Open a command prompt and type "curl https://api.dropbox.com/oauth2/token -d code=THE_CODE_YOU_GOT_FROM_THE_LAST_STEP -d grant_type=authorization_code -u YOUR_APP_KEY:YOUR_APP_SECRET". Hit enter and then copy the "refresh_token" from the result. This is your "refresh_token"
- Now that we have all our dropbox information, download the powershell script "ex.ps1"
-- Set $s to the folder you want to exfiltrate data from
-- Set $fileTypes to the filters for what files you want to grab
-- Set $r to your refresh token from above
-- Set $u to your App Key
-- Set $p to your App Secret
-- Save the script
- Select all the code your newly modified powershell script, and upload it to any of these:
-- Dropbox: Upload the script as a .ps1 file and copy the download link, replacing ?dl=0 at the end with ?dl=1
-- Pastebin: Upload the text and copy the "raw" version of the URL, e.g. [pastebin.com/raw/<script id>]()
-- [Spectre](https://www.klgrth.io/) (Pastebin alternative), Upload the text and copy the url; make sure your add /raw to the end of your url
- Enter the url into payload.txt
- Compile your payload using payloadstudio

This script is for educational purposes only. This script is authorized auditing and security analysis purposes only where permitted subject to local and international laws where applicable. Users are solely responsible for compliance with all laws of their locality. This author claims no responsibility for unauthorized or unlawful use.
