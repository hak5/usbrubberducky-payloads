# Change The App That Will Be Runned

A script used to prank your friends editing the deafault exec operation of desktop files running other app of wich is clicked confusing the user.

**Category**: Prank

![GIF](Change_The_App_That_Will_Be_Runned.gif)

## Description

A script used to prank your friends editing the deafault exec operation of desktop files running other app of wich is clicked confusing the user.

The script will run a shell in wich it will mix 2 application

## Getting Started

### Dependencies

* sudo permissions
* Original desktop file names and exec commands
* The apps must be installed in the target

### Settings

- Set the desktop file name, i.e. for Signal it is `/usr/share/applications/signal-desktop` and the exec command is `/opt/Signal/signal-desktop --no-sandbox %U` 
```DuckyScript
DEFINE ORIGINAL_DESKTOP_FILE_NAME_1 example
DEFINE ORIGINAL_DESKTOP_EXEC_COMMAND_1 example

DEFINE ORIGINAL_DESKTOP_FILE_NAME_2 example
DEFINE ORIGINAL_DESKTOP_EXEC_COMMAND_2 example
```

### Example

- Config
```DuckyScript

DEFINE ORIGINAL_DESKTOP_FILE_NAME_1 /usr/share/applications/code-oss.desktop
DEFINE ORIGINAL_DESKTOP_EXEC_COMMAND_1 /usr/lib/code-oss/code-oss --unity-launch %F

DEFINE ORIGINAL_DESKTOP_FILE_NAME_2 firefox-esr.desktop
DEFINE ORIGINAL_DESKTOP_EXEC_COMMAND_2 /usr/lib/firefox-esr/firefox-esr %u
```

- Content of ORIGINAL_DESKTOP_FILE_NAME_1

```DuckyScript
[Desktop Entry]
Exec=/usr/lib/code-oss/code-oss --unity-launch %F
...
```

- Content of ORIGINAL_DESKTOP_FILE_NAME_2

```DuckyScript
[Desktop Entry]
Exec=Exec=/usr/lib/firefox-esr/firefox-esr %u
...
```

- Result
```Shell
$ cat /usr/share/applications/code-oss.desktop
[Desktop Entry]
Exec=Exec=/usr/lib/firefox-esr/firefox-esr %u
# ...

$ cat /usr/share/applications/firefox-esr.desktop
[Desktop Entry]
Exec=Exec=/usr/lib/code-oss/code-oss --unity-launch %F
# ...
```

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