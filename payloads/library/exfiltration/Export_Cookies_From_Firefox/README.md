# Export Firefox Cookies Database

This script may come in handy for those who want to quickly save all the cookies of their Firefox session by exporting the database via dropbox accesstoken.

**Category**: Exfiltration

## Description

This script may come in handy for those who want to quickly save all the cookies of their Firefox session by exporting the database via dropbox accesstoken.

Open a PowerShell, select dynamically the Firefox path adding "cookies.sqlite" at the end, then set your exfiltration settings i.e. Dropbox access token and so on... then export it, then close the powershell.

## Dependencies

* Firefox must be installed

## Settings

- You must define your Dropbox accessToken or modify the exfiltration modality. Replace just the example word with your token.

    `DEFINE DROPBOX_ACCESS_TOKEN "example"`

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