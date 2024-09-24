# Same File Name Prank

This script, titled **Rename Everything Similarly**, is written in **DuckyScript 3.0** and designed to rename files and directories recursively on **Windows** or **GNU/Linux** systems, depending on the target environment. The script renames directories and files within a specified directory, giving them sequential and similar names.

Specifically, the ability to add a blank space to the end of the name is used. On Windows systems, if file extension viewing is not enabled the names will look identical to the human eye, while on GNU/Linux systems the difference may be more easily noticed.

![No extensions](https://github.com/aleff-github/Deposito/blob/main/Rename_Everything_Similarly/1.png?raw=true)

> How does renaming files using spaces without seeing the extension appear on windows. - To the human eye they look identical.

![With extensions](https://github.com/aleff-github/Deposito/blob/main/Rename_Everything_Similarly/2.png?raw=true)

> What it looks like instead if you turn on the extension view.

# Index

1. [Features](#features)
2. [Payload Structure](#payload-structure)
   - [Conditional Target OS Execution](#conditional-target-os-execution)
   - [PowerShell (Windows)](#powershell-windows)
   - [Bash (GNU/Linux)](#bash-gnulinux)
3. [How to Use](#how-to-use)
4. [Why not MacOS?](#why-not-macos)
5. [Notes](#notes)
6. [Credits](#credits)


## Features
- **Cross-platform support**: The script can be executed on either **Windows** or **GNU/Linux** systems, based on the defined conditions, unfortunately it could not be published for macOS as well, [read more](#why-not-macos).
- **Recursive renaming**: It renames all directories and files inside a given directory, iterating through subdirectories.
- **Customizable**: Users can modify the base directory path and rename pattern as needed.

## Payload Structure

### Conditional Target OS Execution
The script detects (*from the DEFINE*) the target OS and adapts to either **Windows** or **GNU/Linux**:
- If the target system is **Windows**, the script will execute a PowerShell script.
- If the target system is **Linux**, it will execute a Bash script.

### PowerShell (Windows)
For **Windows** systems, the script:
- Opens **PowerShell** and runs the `Rename-Directories` and `Rename-Files` functions.
- It renames directories by assigning sequential names like `d`, `dd`, etc., and files with names like `a`, `a `, `a  `, followed by their respective file extensions.

### Bash (GNU/Linux)
For **GNU/Linux** systems, the script:
- Opens a terminal and executes two Bash functions: `rename_directories` and `rename_files`.
- It performs similar renaming of directories and files, using `mv` to rename them with sequential names (like `d`, `dd`, etc... or `a`, `a `, `a  ` etc...).

## How to Use

1. **Edit Definitions (*not mandatory, Windows by default*)**: Adjust the following definitions in the script according to your environment:
   - `DEFINE #TARGET_WINDOWS TRUE`: Leave **#TARGET_WINDOWS** to **TRUE** if the script will run on a Windows system.

   - `DEFINE #TARGET_GNU_LINUX FALSE`: Set **TARGET_LINUX** to **TRUE** if the script will run on a GNU/Linux system.
   
   - Ufortunately it could not be published for macOS as well, [read more](#why-not-macos).

   - `#DIRECTORY_WHERE_TO_RUN_THE_COMMAND`: Specify the base directory where the renaming operation should occur, the default is `.` so the default route of Powershell and Bash.
   
      Consider that the main route for Windows generally is `C:\Users\Username\` while for GNU/Linux systems it is something like `/home/username/` but in both cases if for istance you add `./Desktop/Hello/World/` you will go to the World folder in the path `C:\Users\Username\Desktop\Hello\World\` for Windows systems and `/home/username/Desktop/Hello/World/`.

      Of course, you have to make sure that this folder exists....

      ![Windows command](https://github.com/aleff-github/Deposito/blob/main/Rename_Everything_Similarly/3.png?raw=true)

      > How Windows response to the command `cd ./Desktop/Hello/World/`

      ![Ubuntu command](https://github.com/aleff-github/Deposito/blob/main/Rename_Everything_Similarly/4.png?raw=true)

      > How Ubuntu response to the command `cd ./Desktop/Hello/World/`

      Consider the maximum length of file names on both Windows and GNU/Linux:
         
      - [Limit on file name length in bash \[closed\]](https://stackoverflow.com/questions/6571435/limit-on-file-name-length-in-bash)
         
         |=> https://stackoverflow.com/questions/6571435/limit-on-file-name-length-in-bash

      - [On Windows, what is the maximum file name length considered acceptable for an app to output? (Updated and clarified)](https://stackoverflow.com/questions/8674796/on-windows-what-is-the-maximum-file-name-length-considered-acceptable-for-an-ap)
         
         |=> https://stackoverflow.com/questions/8674796/on-windows-what-is-the-maximum-file-name-length-considered-acceptable-for-an-ap

2. **Load Payload**: Upload the script to a USB Rubber Ducky device using the **DuckEncoder**.

3. **Execute Payload**: Insert the USB Rubber Ducky into the target machine.

## Why not MacOS?

I am very sorry not to be able to release scripts for macOS systems as well but unfortunately not having one would be too risky to test it in a VM, at least in my opinion, so if someone from the community wants to contribute they could propose a pull request with the macOS version so that we can integrate it and make this payload cross-platfom.

If I could know the behavior of this script on macOS (*which probably remains completely unchanged from use on GNU/Linux systems*) it could be optimized in that it could be reduced to a **WINDOWS_PASSIVE_DETECT** where if it is not Windows (*so generally GNU/Linux or macOS systems*) the bash script may be fine.

## Notes
- Ensure that the specified directories exist on the target machine.
- Use with caution on sensitive systems, as the renaming process is recursive and may affect large directories.
- Contributions to add support for macOS are welcome.

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