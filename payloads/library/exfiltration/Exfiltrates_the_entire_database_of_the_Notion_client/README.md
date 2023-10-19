# Exfiltrates the entire database of the Notion client

This script can be used to exfiltrate the entire Notion database and thus all client-level content of your Notion account.

**Category**: Exfiltration

## Description

This script can be used to exfiltrate the entire Notion database and thus all client-level content of your Notion account.

Open a PowerShell, the get dinamically the Notion full-path and then add the `notion.db` string. Then create all the needed variables for the exfiltration and then send it trough Dropbox. I used Dropbox but you can use whatever you want.

## Dependencies

* Notion must be installed
* Internet Connection

## Settings

- You must define your Dropbox accessToken or modify the exfiltration modality. Replace just the example word with your token.

`DEFINE #DROPBOX_ACCESS_TOKEN "example"`

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
      <a href="https://www.instagram.com/alessandro_greco_aka_aleff/">
        <img src=https://github.com/aleff-github/aleff-github/blob/main/img/instagram.png?raw=true width="48" height="48" />
      </a>
      <br>Instagram
    </td>
    <td align="center" width="96">
      <a href="https://www.linkedin.com/in/alessandro-greco-aka-aleff/">
        <img src=https://github.com/aleff-github/aleff-github/blob/main/img/linkedin.png?raw=true width="48" height="48" />
      </a>
      <br>Discord
    </td>
  </tr>
</table>
</div>
