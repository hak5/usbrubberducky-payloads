# Save Your Thunderbird Settings via Dropbox

Thunderbird version, build ID, user agent, host machine information (RAM, available space, GPU...), email account configuration and much more available through this juicy Thunderbird feature.

This payload is designed in order to make Thunderbird configuration extraction immediate so that you can work in speed. It can be used, for istance, in case you have a lot of devices and want to quickly and manually save every single Thunderbird configuration.

**Alert!** I have also uploaded my personal Dropbox token, please don't use it because I need it for my own stuff!

**Category:** Exfiltration

## Index

- [Overview](#overview)
- [Requirements](#requirements)
- [Test Environment](#test-environment)
- [Configuration](#configuration)
- [Functionality](#functionality)
  - [System Detection](#system-detection)
  - [Opening Thunderbird](#opening-thunderbird)
  - [Copying Profile Folder Path](#copying-profile-folder-path)
  - [Opening PowerShell and Uploading to Dropbox](#opening-powershell-and-uploading-to-dropbox)
- [Notes](#notes)
- [Credits](#credits)

## Overview

This program automates the process of saving your Thunderbird settings to Dropbox. It is designed for Windows 10/11 systems and falls under the exfiltration category. The main functionality includes detecting the system state, opening Thunderbird, copying the profile folder path, compressing the profile folder, and uploading it to Dropbox.

## Requirements

- **Dropbox Access Token:** You need a valid Dropbox access token to upload the file.
- **PowerShell:** The script uses PowerShell to execute commands and interact with the filesystem.
- **Thunderbird:** In order to exfiltrate the Thunderbird configuration, it is essential to have Thunderbird configured...obvious right? And yet...

## Test Environment

- Thunderbird 115.11.1 (64 bit)
- Windows 10 Pro

## Configuration

Before running the program, ensure to set the following parameters (*except #DROPBOX_API_CONST that is a constant*) correctly/as you prefer:

```plaintext
DEFINE #ACCESS_TOKEN aHR0cHM6Ly93d3cueW91dHViZS5jb20vd2F0Y2g/dj1Sdlk1cGxvbzFPSQ==
DEFINE #ARCHIVE_NAME cache.zip
DEFINE #DROPBOX_FOLDER_PATH /
DEFINE #DROPBOX_API_CONST https://content.dropboxapi.com/2/files/upload
```
- `#ACCESS_TOKEN`: Your private Dropbox access token
- `#ARCHIVE_NAME`: The name of the archive file to be created (e.g., `cache.zip`).
- `#DROPBOX_FOLDER_PATH`: The path in your Dropbox where the file will be uploaded (e.g., `/`).

## Functionality

### System Detection

The program starts by detecting whether the system reflects the CAPSLOCK state. This is used to set a dynamic boot delay. If CAPSLOCK is not reflected, a maximum delay of 3000ms is applied.

### Opening Thunderbird

The script then opens Thunderbird and navigates through the settings to locate the profile folder. This path is copied to the clipboard for further use.

### Copying Profile Folder Path

The copied path of the Thunderbird profile folder is used to compress the profile data into a ZIP file.

### Opening PowerShell and Uploading to Dropbox

Using PowerShell, the script performs the following actions:

1. **Navigate to TEMP Directory:** Changes the directory to the temporary environment path.
2. **Stop Thunderbird Process:** Stops the Thunderbird process to ensure the profile data is not being used.
3. **Compress Profile Folder:** Compresses the profile folder into a ZIP file.
4. **Upload to Dropbox:** Uploads the ZIP file to the specified Dropbox folder using the Dropbox API.
5. **Cleanup:** Removes the local ZIP file after the upload is complete.

## Notes

- This program was created for educational and demonstrative purposes. Unauthorized access and exfiltration of data is illegal.
- Ensure you have the necessary permissions before running any script that modifies or transfers personal or sensitive data.

## Credits

<h2 align="center"><a href="https://aleff-gitlab.gitlab.io/">Aleff</a></h2>
<div align=center>
<table>
  <tr>
    <td align="center" width="96">
      <a href="https://github.com/aleff-github">
        <img src=https://github.com/aleff-github/aleff-github/blob/main/img/github.png?raw=true width="48" height="48" />
      </a>
      <br>Github
    </td>
    <td align="center" width="96">
      <a href="https://www.linkedin.com/in/alessandro-greco-aka-aleff/">
        <img src=https://github.com/aleff-github/aleff-github/blob/main/img/linkedin.png?raw=true width="48" height="48" />
      </a>
      <br>Linkedin
    </td>
  </tr>
</table>
</div>