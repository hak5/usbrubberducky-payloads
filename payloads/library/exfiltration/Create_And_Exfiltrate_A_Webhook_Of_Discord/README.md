# Create And Exfiltrate A Webhook Of Discord

This script allows you to create a Webhook of a Discord server quickly and exfiltrate it. For demonstration purposes another Discord webhook was used for exfiltration but of course any method you prefer can be used.

**Category**: Exfiltration

## Description

This script allows you to create a Webhook of a Discord server quickly and exfiltrate it. For demonstration purposes another Discord webhook was used for exfiltration but of course any method you prefer can be used.

First of all open Discord trough Windows GUI, the open time may vary depending on the pc and whether there may be updates that need to be done. When it is open, search the server using a Discord keyboard shortcut *\<server_name>, then go to first channel and open the settings using TABx11, then go to Integration settings using TABx6 and DOWN_ARROWx3, then create a Webhook (Because it may happen that there is still not even one) and copy the first reachable, then close Discord.

To do the exfiltration I decided to use another discord webhook but of course you can use whatever exfiltration method you prefer.

**Stealing a Discord webhook without authorization is considered a cybercrime**. Acquiring a webhook without proper permission is a violation of digital security and can be subject to legal consequences.

## Dependencies

* Discord Installed
* Internet connection

## Settings

- You must define the Discord server name i.e. Hak5

    `DEFINE #SERVER_NAME example`

- You must define your Dropbox accessToken or modify the exfiltration modality.

    `DEFINE #DISCORD_WEBHOOK example`

- The open time may vary depending on the pc and whether there may be updates that need to be done
    
    `DELAY 6000`
    
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
