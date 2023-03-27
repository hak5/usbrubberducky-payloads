- **Configure your Dropbox application**

    - Create a Dropbox account.
    - [Create a Dropbox "App"](https://www.dropbox.com/developers/apps/create) with a "Scoped access" API and a "Full Dropbox" access.
    - Go to the settings of this app and write down your "App key" and "App secret".  
    *These are your "<APP_KEY>" and "<APP_SECRET>".*
    - Next, go to the "Permissions" tab and enable the "files.metadata.write" and "files.content.write" permissions.
    - After that, open this link in your browser *(values between brackets must be changed)*.
    ```
    https://www.dropbox.com/oauth2/authorize?client_id=<APP_KEY>&token_access_type=offline&response_type=code
    ```
    - Connect your application, allow its permissions, and note the code it gives you.  
    *This is your "<APP_CODE>".*
    - Open a command prompt and run this command *(values between brackets must be changed)*.
    ```
    curl https://api.dropbox.com/oauth2/token -d code=<APP_CODE> -d grant_type=authorization_code -u <APP_KEY>:<APP_SECRET>
    ```
    - Note the "refresh_token" value of the result.  
    *This is your "<REFRESH_TOKEN>".*
