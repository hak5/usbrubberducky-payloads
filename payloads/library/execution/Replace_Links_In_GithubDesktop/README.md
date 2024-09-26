# Replace Links In GithubDesktop

This script is written in **DuckyScript** and is designed to modify links in the GitHub Desktop application on Windows 10/11 systems. It automates the replacement of GitHub URLs with a custom URL defined by the user.

![](https://github.com/aleff-github/Deposito/blob/main/Replace_Links_In_GithubDesktop/GithubDesktop.gif?raw=true)

## Table of Contents

- [Features](#features)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Credits](#credits)

## Features

This script replaces the hardcoded GitHub links in the `renderer.js` and `main.js` files inside the GitHub Desktop application with a custom link provided by the user. It does the following:

1. Detects the installation folder of GitHub Desktop.
2. Identifies the latest installed version of GitHub Desktop. It may happen that there are multiple versions on the computer but it is always the most recent one that is used, I would suggest to Github Desktop developers to remove old versions that unnecessarily burden a computer.
3. Replaces any occurrences of GitHub URLs in the `renderer.js` and `main.js` files with a new link defined by the user.

The script uses **PowerShell** to perform this replacement after detecting the operating system and target files.

## Prerequisites

- **Windows 10/11**
- **GitHub Desktop** installed on the machine.

## Usage

1. **Modify the script**:
   - Define the new URL to replace the original GitHub link by modifying the `#NEW_LINK` variable in the script:
     ```duckyscript
     DEFINE #NEW_LINK example.com
     ```

2. **Customization**:
   - Ensure that the path to GitHub Desktop is correct. If GitHub Desktop is installed in a non-default location, modify the `#SUBDIRECTORY` variable accordingly:
     ```ducky
     DEFINE #SUBDIRECTORY \AppData\Local\GitHubDesktop
     ```

3. **Execution**:
   - Upon execution, the script will:
     - Open PowerShell.
     - Detect the GitHub Desktop installation directory.
     - Replace all GitHub URLs in the `renderer.js` and `main.js` files with the new URL you specified.

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