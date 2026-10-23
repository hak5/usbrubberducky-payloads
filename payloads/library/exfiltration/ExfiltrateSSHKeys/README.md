# ExfiltrateSSHKeys

Author: [thomasgruebl](https://github.com/thomasgruebl)<br>
OS: Windows (fully functional), macOS (fully functional), Linux (partly functional)<br>
Version: 1.0<br>
Requirements: DuckyScript 3.0, PayloadStudio v1.3.1

## Description

*The ExfiltrateSSHKeys payload can be used to check for the existence of the ~/.ssh directory and exfiltrate its contents to the USB Rubber Ducky. In addition, the payload performs a recursive search on a pre-defined parent directory, looking for any private key files and subsequently exfiltrating them.*
#
## Settings

- You must define the parent directory to perform the recursive search (e.g. Desktop):

    `DEFINE #PARENT_DIR Desktop`

- You must define your ducky drive label:

    `DEFINE #DUCKY_DRIVE_LABEL DUCKY`

- You can switch between operating systems by changing the following bools:

    `DEFINE #WINDOWS TRUE`

    `DEFINE #MACOS FALSE`

    `DEFINE #LINUX FALSE`

    Only set ONE definition at the time to TRUE (e.g. DEFINE #WINDOWS TRUE). DEFINE #WINDOWS TRUE, DEFINE #MACOS TRUE, and DEFINE #LINUX TRUE won't function.
