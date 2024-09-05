# Install Official VSCode Extension

This script automates the installation of an official Visual Studio Code extension on Windows 10/11 systems. The extension to be installed is specified via the `publisher.extensionName` parameter. The script uses passive operating system detection to determine if the system is running Windows, and proceeds with the extension installation accordingly.

## First Of All!

Installing Arbotrary Visual Studio Code (VSCode) extensions can pose cybersecurity risks because extensions, often developed by third parties, have access to critical functionalities of the editor and the operating system. A malicious extension could execute harmful code, access local files, or exfiltrate sensitive data without the user's knowledge. Additionally, if extensions are not from trusted sources or are not regularly updated, they may contain vulnerabilities that attackers can exploit, compromising the security of both the system and the entire development environment.

So...
- Before doing these tests make sure you have full permission from the owner of the computer in case it is not you.
- Always check the source and source code before doing this
- If even one line of code is not clear to you, you should not proceed at all because it takes only a little to do damage.

## Features

- **Passive Windows Detection:** The script includes an extension (`PASSIVE_WINDOWS_DETECT`) that passively detects if the operating system is Windows.
- **VSCode Extension Installation:** It uses the `code --install-extension` command to install the specified VSCode extension.
- **Windows 10/11 Compatibility:** Designed to work on Windows 10 and 11.
- **PowerShell History Cleanup:** After installation, the PowerShell history is cleared.

## Usage

### Required Parameter

- **#EXTENSION**: This parameter represents the ID of the VSCode extension you wish to install. The ID should follow the format `publisher.extensionName` (e.g., `Aleff.duckyscriptcookbook`).

## Requirements

- **Operating System**: Windows 10 or 11
- **PowerShell**
- **Visual Studio Code**
- **Internet**
- **Permissions to execute commands in PowerShell**

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
