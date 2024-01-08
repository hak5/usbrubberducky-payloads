# Export all saved certificates with Adobe Reader

This script can be used to export all PFX certificates saved in plain text and without any protection from Adobe Reader.

**Category**: Exfiltration

## Description

This script can be used to export all PFX certificates saved in plain text and without any protection from Adobe Reader.

Open a PowerShell, go to Adobe Reader Path dinamically, then select all the pfx certificates, then set the exfiltration settings and export the certificates trough a foreach using Dropbox.

**The unauthorized extraction of PFX certificates can be considered a criminal offense**. Taking possession of such certificates, which contain sensitive information such as private keys and critical authentication data, violates the owner's property rights.

## Dependencies

* Adobe Reader must be installed
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
      <a href="https://www.linkedin.com/in/alessandro-greco-aka-aleff/">
        <img src=https://github.com/aleff-github/aleff-github/blob/main/img/linkedin.png?raw=true width="48" height="48" />
      </a>
      <br>Linkedin
    </td>
  </tr>
</table>
</div>
