# "Microsoft Windows" Get TrustedInstaller

- Title:         Execute commands as 'NT AUTHORITY\SYSTEM' with 'TrustedInstaller' privileges
- Author:        TW-D
- Version:       1.0
- Category:      Execution

## Description

Launch a new cmd.exe process with elevated privileges under TrustedInstaller,
by setting the TrustedInstaller process as the parent, the cmd.exe process inherits TrustedInstaller's privileges.

For more information, follow: [The Art of Becoming TrustedInstaller](https://www.tiraniddo.dev/2017/08/the-art-of-becoming-trustedinstaller.html)

## Tested On

>
> Microsoft Windows 10 Professionnel 22H2
>

__Note :__ *The target user must belong to the 'Administrator' group.*

## Configuration

In the "payload.txt" file, replace the values of the following constants :

```

REM ---
REM USB Rubber Ducky label.
REM ---
DEFINE #RD_LABEL DUCKY

REM ---
REM TrustedInstaller initial command.
REM ---
DEFINE #TRUSTEDINSTALLER_COMMAND "WHOAMI /ALL"

```

## Usage

At the root of the USB Rubber Ducky, copy the "TrustedInstaller.ps1" file.
