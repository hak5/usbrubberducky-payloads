# Persistent Keylogger - Telegram Based

A script used to configure a persistent keylogger on a Linux computer through a pre-configured Telegram Bot.

**Category**: Execution

## Dependencies

* Internet Connection

## Description

A script used to configure a persistent keylogger on a Linux computer through a pre-configured Telegram Bot.

This payload is based on [Telegram Persistent Connection](Telegram_Persistent_Connection) payload for create the Telegram connection.

In the script, you can find two classes that inherit Thread called Keylogger and Sender, and a shared memory class called Log. The Thread classes perform two distinct tasks:

- Keylogger: The Keylogger class is responsible for capturing the pressed keys using the keyboard library. Based on the detected key, a modified callback function specified in the function call is invoked. When the usage of a certain keyboard key is detected, it is subsequently added to the log variable using the `add_to_log()` method of the `self.log` object from the Log class.

- Sender: The Sender class represents a thread solely dedicated to periodically invoking the `send_log()` method of the `self.log` object from the Log class.

- Log: The Log class represents a shared memory entity. The shared memory is the variable `self.log`, which is periodically managed through the `add_to_log()` and `send_log()` methods. This class was designed with the aim of avoiding data loss, and thus a lock management system was applied to prevent undesirable or unexpected situations when multiple users write rapidly. To handle the locks, `RLock` and `Condition` were chosen in the respective methods of the class.

The `add_to_log(self, log)` method acquires the lock through the invocation of `with self.lock` and updates the internal variable with the new received character. As the only waiting condition on the lock management is when the variable `self.lock` is empty, immediately after updating the internal variable, the unlocking function `self.condition.notify_all()` is invoked, allowing all threads (in this case, actually only 1, the Sender) to wake up and proceed with the sending operation.

The `send_log(self)` method acquires the lock and enters a waiting condition using `self.condition.wait()` if the variable `self.log` is empty. Once the lock is reacquired following a wake-up, the Sender Thread proceeds with sending the message using the `bot.send_message(...)` command, resetting the `self.log` variable to an empty initial state.

It is worth noting that although this Telegram bot could be used dynamically by anyone, it might be a good practice to use the ID statically (line 16 of the Python file) since the message recipients will always be you and not someone else (at least it shouldn't be so). This aspect may be considered less secure as it exposes sensitive and delicate information concerning your privacy and identity. However, since this script is not intended for malicious purposes or real-world use, but rather for educational purposes, it has been thoughtfully created and designed for study purposes.

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
