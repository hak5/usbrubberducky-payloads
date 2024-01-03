# Telegram Persistent Connection

A script used to configure a persistent connection on a Linux computer through a pre-configured Telegram Bot.

**Category**: Execution

## Description

A script used to configure a persistent connesction on a Linux computer through a pre-configured Telegram Bot.

Opens a shell, download the python script through the `curl` command outputing the file into a `connection.py` file using `-o` option, then run it and set the run of the program as a default command every times a shell is runned.

This payload is intended as a basic reference point for developing payloads on a persistent connection Telegram based.

## Getting Started

### Dependencies

* Internet Connection

### Settings

- **Telegram Bot**: You should configure a bot through Telegram. If you don't know how to do this, follow the guide about [Telegram Bot guide](#telegram-bot-guide). When you have create your personal Telegram Bot you should get the Telegram bot ID that you must put into the variable BOT_TOKEN at line 4 in the Python file as you can read in the line 3 comment.
- **Python Script**: Download, edit as you want and upload the python script somewhere you want and put the file link into the file payload.txt replacing the example link.
- **Persistence**: I preferred to create a mechanism that would allow you to create *some* persistence, not quite total, but you can have a high level of persistence. In this specific case, no permissions are needed, because it is sufficient to insert some lines in the .bashrc file that allow to keep the connection to Telegram open from the first time the user opens the terminal. Most of other mechanism needs the sudo permissions. 

### Telegram Bot Guide

1. Search for `@botfather` in Telegram.
2. Start a conversation with BotFather by clicking on the Start button.
3. Type /newbot, and follow the prompts to set up a new bot.
4. Select and copy the Bot Token that you can see after the registration and past it into the `BOT_TOKEN` python variable that you find in the `connection.py` file at line 3.

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
