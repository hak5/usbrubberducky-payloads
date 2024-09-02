# Send Email Through Thunderbird

This payload can be used to prank friends by sending emails at top speed from their thunderbird clients.

**Category**: Execution

## Description

This payload can be used to prank friends by sending emails at top speed from their thunderbird clients.

This payload opens a shell (or powershell if running on windows), starts the Thunderbird application, and via the CTRL N sequence starts the email sending functionality that is not protected by any security system. After that it writes the recipient's email, the subject of the email and the body of the message and sends.

## Getting Started

### Windows 11

```DuckyScript
DELAY 1000
GUI r
DELAY 1000
STRING powershell
ENTER
DELAY 2000
STRINGLN Start-Process "thunderbird.exe"
DELAY 4000
```

### Ubuntu 23.04

```DuckyScript
DELAY 1000
CTRL-ALT t
DELAY 2000
STRINGLN thunderbird
DELAY 4000
```

### Dependencies

* Internet Connection
* Thunderbird installed and email configured
* ExecutionPolicy Bypass (for Windows target)

### Settings

- Receiver email address
- Email Subject
- Email Message

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