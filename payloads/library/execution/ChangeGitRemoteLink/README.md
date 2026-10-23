# Change Remote Git Link

This script can be used to change the remote link from which updates will be downloaded and where new updates will be uploaded.

**Category**: Execution

## Description

This script can be used to change the remote link from which updates will be downloaded and where new updates will be uploaded.

This script turns out to be very useful for aviting data leaks between old cloned repositories and new online repositories.

To make it easier to use below you can find the various tested configurations, at the moment it is not available for macOS because since I do not have one it cannot be tested and therefore I cannot give the certainty that it works, however I hope that in the Hak5 community there may be someone who can contribute to this payload by completing it with this missing part.

## Payload.txt config - Windows 10/11 - Tested on Windows 11

```DuckyScript
    DELAY 1000
    GUI r
    DELAY 1000
    STRING powershell
    ENTER
    DELAY 2000
```

## Payload.txt config - Linux (Debian based) - Tested on Ubuntu 23.04

```DuckyScript
    DELAY 1000
    CTRL-ALT t
    DELAY 2000
```


## Dependencies

* Internet Connection
* git installed
* Full path of the cloned repository
* ExecutionPolicy Bypass

## Settings

- Full path of the local repository i.e. "C:\Users\User\Documents\Repository1"
```DuckyScript
    DEFINE #FULL-PATH example
```

- Link from which updates are to be downloaded so the new repository the Repository2
```DuckyScript
    DEFINE #NEW-GIT-LINK example.git
```

- REM Define the branch of the new repository Repository2, i.e. "main"
```DuckyScript
    DEFINE #BRANCH example
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