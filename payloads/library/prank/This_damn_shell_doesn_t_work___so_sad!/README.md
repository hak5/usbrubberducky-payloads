# This Damn Shell Doesn't Work, SO SAD! :C

This payload can be used to prank your friends so that when they open their terminal it will close immediately.

**Category**: Prank

![](1.gif)

## Dependencies

* Nothing <3

## Description

The described payload aims to modify the configuration file of the default shell environment in a Linux system, specifically the `.bashrc` file. This file is executed every time a user opens a terminal or a Bash shell session. By inserting the `exit` command as the first line in the `.bashrc` file, it causes the shell to terminate immediately upon opening, preventing the user from executing any further commands or operations within the shell.

However, it's important to note that starting from version 2020.4, Kali Linux has changed its default shell from Bash to Zsh \[1] for users installing this distribution. Consequently, the main configuration file is no longer `.bashrc` but `.zshrc`. Therefore, if the target is a Kali Linux machine with this version or later, it's necessary to modify the `.zshrc` file instead of `.bashrc`.

To correctly identify whether the target system is Kali Linux and if it's using Zsh as the default shell, the payload suggests using a variable `#TARGET_KALI_LINUX`, which should be set to `TRUE`. This variable would serve as a placeholder to distinguish between usage on Kali Linux and other Linux systems.

To restore proper shell operation, it will be necessary to edit via a text editor the `.bashrc` or `.zshrc` file by deleting the first line that consists of the command `exit`.

## Read More

- \[1] [Kali Linux 2020.4 switches the default shell from Bash to ZSH
](https://www.bleepingcomputer.com/news/linux/kali-linux-20204-switches-the-default-shell-from-bash-to-zsh/)

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