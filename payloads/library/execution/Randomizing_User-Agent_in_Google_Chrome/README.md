# Randomizing User-Agent in Google Chrome

This DuckyScript payload automates the process of modifying the Google Chrome user-agent dynamically by integrating a random user-agent retriever using `torify` and `curl`. Additionally, it ensures that execution traces are erased if configured.

## Why Randomizing User-Agent Matters

One of the most crucial aspects of online privacy is minimizing trackable elements that websites can use to uniquely identify users. The user-agent, which reveals browser and operating system details, is one such element that can contribute to fingerprinting—a technique used to track users even if they clear cookies or use incognito mode.

The Electronic Frontier Foundation (EFF) provides a tool called [Cover Your Tracks](https://coveryourtracks.eff.org/) that highlights how unique a browser fingerprint can be. Even subtle details such as screen resolution, installed plugins, and HTTP headers can contribute to a highly distinctive digital fingerprint. By randomizing the user-agent dynamically, this script mitigates one of the key tracking vectors, making it more difficult for advertisers, trackers, and malicious entities to create persistent identifiers for users.

This script ensures that every new browser session starts with a different user-agent, making it harder for websites to link previous and current browsing activities. Additionally, by leveraging torify, it provides an extra layer of anonymity by routing the request through the Tor network, reducing the chances of associating the request with a specific IP address.

**This tool does not anonymize you sufficiently**, but to check this and to explore it further you can read what [EFF says about it](https://www.eff.org/deeplinks/2020/11/introducing-cover-your-tracks).

## Prerequisites
- A Linux-based system
- Google Chrome installed
- `torify`, `curl`, `awk`, and `gtk-update-icon-cache` installed
- Sudo user privileges

## Script Breakdown

### 1. Define Constants

- This defines a placeholder for the sudo password, which will be required when modifying system files.

    ```ducky
    REM Replace it with your sudo user password
    DEFINE #SUDO_PSWD example
    ```

- This variable is determined by the target

    ```ducky
    REM May it depends...
    DEFAULT_DELAY 250
    ```

- A conditional flag to determine whether to erase command execution history.

    ```ducky
    REM Define if you want to erase the tracks of your commands
    DEFINE I_WANT_TO_ERASE_THE_SHELL_TRACKS TRUE
    ```

### 2. Open Terminal

- Opens a terminal window and waits for 1 second.

    ```ducky
    CTRL-ALT t
    DELAY 1000
    ```

### 3. Create Bash Script to Randomize User-Agent

- Creates a new bash script named `.randomize_user_agent`.

    ```ducky
        echo '#!/bin/bash' > .randomize_user_agent
    ```

- Retrieves a random user-agent using `torify` and `curl` from user-agents.net.

    ```ducky
        echo 'UA=$(torify curl "https://user-agents.net/random" -H "content-type: application/x-www-form-urlencoded" -H "referer: https://user-agents.net/random" --data-raw "limit=1&action=generate")' >> .randomize_user_agent
    ```

- Defines a regular expression to extract the user-agent string.

    ```ducky
        echo 're="<li><a href=\".+\">(.+)<\/a><\/li>"' >> .randomize_user_agent
    ```

- If the regex successfully extracts a user-agent, Chrome is launched with it. Otherwise, it launches normally.

    ```ducky
        echo 'if [[ $UA =~ $re ]]; then
            /usr/bin/google-chrome-stable --user-agent="${BASH_REMATCH[1]}"
        else
            /usr/bin/google-chrome-stable
        fi' >> .randomize_user_agent
    ```

- Makes the script executable.

    ```ducky
        sudo chmod +x .randomize_user_agent
    ```

- Placeholder for executing the command with sudo privileges.

    ```ducky
        #SUDO_PSWD
    ```

### 4. Modify Chrome Application Shortcut

- Stores the path of the newly created script.

    ```ducky
        NEW_STRING="/home/$(whoami)/.randomize_user_agent"
    ```

- Modifies the Chrome `.desktop` file to replace the default executable path with the newly created script.

    ```ducky
        awk -v new="$NEW_STRING" '{gsub("/usr/bin/google-chrome-stable", new)}1' /usr/share/applications/google-chrome.desktop > tmp
    ```

- Applies the modified `.desktop` file.
    
    ```ducky
        sudo tee /usr/share/applications/google-chrome.desktop < tmp
    ```

- Updates the icon cache to reflect the changes.

    ```ducky
        gtk-update-icon-cache
    ```

### 5. Erase Execution Traces (Optional)

- If enabled, removes the shell history file and exits the terminal to erase execution traces.

    ```ducky
    IF_DEFINED_TRUE #I_WANT_TO_ERASE_THE_SHELL_TRACKS
        REM It is assumed that a shell has already been opened...
        STRINGLN rm $HISTFILE; exit
    END_IF_DEFINED
    ```

## Security Considerations

- Modifying system files (`/usr/share/applications/google-chrome.desktop`) requires sudo privileges, which can be a security risk.

- The use of `torify` ensures anonymity, but not only that, this will allow you to make unlimited requests by exceeding the maximum number of requests per connection provided by the service you use. 

- Clearing command history can be useful for security but may also make debugging harder.

