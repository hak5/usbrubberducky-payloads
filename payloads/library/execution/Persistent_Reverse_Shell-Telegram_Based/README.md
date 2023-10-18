# Persistent Reverse Shell - Telegram Based

A script used to configure a persistent reverse shell on a Linux computer through a pre-configured Telegram Bot.

**Category**: Execution

## Dependencies

* Internet Connection

## Description

A script used to configure a persistent reverse shell on a Linux computer through a pre-configured Telegram Bot.

This payload is based on [Telegram Persistent Connection](Telegram_Persistent_Connection) payload for create the Telegram connection.

The script accept the `/reverse` command using the format `/reverse <shell_command>` and split `/reverse` from `<shell_command>` through the `extract_command()` function, then execute the command acquired acquiring the output through the function `run_command()`.

Because Telegram uses a limited size per message, the script divides the output of the command into a theoretically infinite chunk of 1000 characters in length that will be sent one by one through the Telegram Bot.

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