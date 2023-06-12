# Tree Structure Of The Operating System

This script allows the exfiltration of the structure of the files contained in a machine, through the use of the tree command in fact it is possible to know all the various links between files, folders and subfolders in a quick and graphically easy to understand way.

**Category**: Exfiltration

![](1.png)

## Description

This script allows the exfiltration of the structure of the files contained in a machine, through the use of the tree command in fact it is possible to know all the various links between files, folders and subfolders in a quick and graphically easy to understand way.

Open a PowerShell and run the command `tree /f /a > out.txt` that permit to list the file name and not only the directories, using text characters instead of graphic characters to display rows linking subdirectories. Save all the output in the out.txt file and then send this file through Dropbox.

## Dependencies

* Firefox must be installed

## Settings

- You must define your Dropbox accessToken or modify the exfiltration modality.

    `DEFINE #DROPBOX_ACCESS_TOKEN example`

- The path to check can be changed putting the full-path `tree <full-path> /f /a > out.txt`.

    - `tree \ /f /a > out.txt`
    - `tree C:\Users\Aleff\Documents /f /a > out.txt`