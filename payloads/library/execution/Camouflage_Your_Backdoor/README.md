# Camouflage Your Backdoor

This repository contains a demonstration **USB Rubber Ducky payload** called **Camouflage Your Backdoor**. The purpose of this script is to show how easily an attacker can hide malicious connections from system administrators or regular users by **overriding** the `netstat` command in a **Debian-based** environment (or any system using `~/.bashrc`).  

![](https://github.com/aleff-github/Deposito/blob/main/Camouflage%20your%20backdoor/front.png?raw=true)
> *This gentleman shows how with a rubber duck you can hide a back door*

---

## What Does This Payload Do?

1. **Lures the Target’s Terminal**:  
   The script opens a new terminal window (using a keyboard shortcut) so it can execute commands in the background.

2. **Modifies `~/.bashrc`**:  
   It appends a function definition to the `~/.bashrc` file, overriding the standard `netstat` command. Specifically, the script hides any line containing a designated IP address (the “backdoor IP”) from the output of `netstat`.  

3. **Cleans Up**:  
   The script removes the command history (`rm $HISTFILE`) and exits, leaving minimal traces of the intrusion at a quick glance. No sudo permissions are required.

---

## The Consequences

### Before The Attack

![](https://github.com/aleff-github/Deposito/blob/main/Camouflage%20your%20backdoor/1.png?raw=true)

### After The Attack

![](https://github.com/aleff-github/Deposito/blob/main/Camouflage%20your%20backdoor/2.png?raw=true)

---

## The DuckyScript

Here is the most important **DuckyScript** lines of code in the payload:

```text
REM Here the IP of the backdoor that is to be camouflaged
DEFINE #BACKDOOR_IP_TO_CAMOUF example

REM Open a shell
CTRL-ALT t
DELAY 1000

REM The payload
STRINGLN_BASH
    echo "function netstat() {
        command netstat \"\$@\" | grep -v #BACKDOOR_IP_TO_CAMOUF
    }
    " >> ~/.bashrc; rm \$HISTFILE; exit
END_STRINGLN
```

### Explanation

- **DEFINE #BACKDOOR_IP_TO_CAMOUF**: This sets a variable for the IP to conceal (e.g., `192.123.123.123`).  
- **CTRL-ALT t** and **DELAY 1000**: Opens a new terminal window and waits a moment for it to appear.  
- **STRINGLN_BASH**: Sends multiline text to the terminal, which:
  1. Appends a new function `netstat()` to `~/.bashrc`.
  2. Uses `grep -v #BACKDOOR_IP_TO_CAMOUF` to filter out lines that contain the specified IP address.
  3. Removes the **history file** (`rm $HISTFILE`) to eliminate evidence.
  4. Exits the shell.  

By redefining `netstat`, any user who relies on this command to check active connections will **not** see connections involving `#BACKDOOR_IP_TO_CAMOUF`.

---

## Why Is This Dangerous?

1. **Stealthy Backdoor**:  
   An attacker could have a malicious service (e.g., a reverse shell) connecting to `#BACKDOOR_IP_TO_CAMOUF`. After this script runs, `netstat` on the compromised machine won’t reveal those connections.

2. **Quick Execution**:  
   The **USB Rubber Ducky** injects these commands in **seconds** on an unlocked system, often leaving no obvious trace for the victim.

3. **Misplaced Trust**:  
   Administrators checking system connections may incorrectly assume they see *all* activity, unaware that netstat has been overridden.

4. **Extensible Attack**:  
   This technique can be adapted to other core commands like `ls`, `ps`, `top`, etc. The attacker can hide processes, files, or any other signs of compromise.

---

## Why sudo netstat Still Shows Connections

When we define the custom netstat function in a user’s `~/.bashrc`, it only affects that user’s shell environment. However, if you run the command via sudo, you typically switch to the root environment, which does not include the overridden netstat function from your user account.

The `~/.bashrc` (or other configuration files) for root reside under `/root/`, which is distinct from a standard user’s home directory. Unless you also modify `/root/.bashrc` or other relevant files for root, the netstat binary will remain unmodified when you use `sudo`.

By default, sudo does not preserve the calling user’s shell functions or environment variables. It launches the new process under root’s clean environment. Hence, the original system netstat is executed, revealing all connections, including the supposedly hidden IP.

If you configure sudo to preserve specific environment variables or shell functions (for instance, using the `-E` flag or modifying `/etc/sudoers`), then the override might carry over to the elevated session. However, this is rarely a default setting and usually requires explicit configuration.

In a real-world scenario, an attacker determined to hide connections from root as well might attempt to modify root’s shell configuration or even replace the binary at the system level - a more complex and riskier technique that leaves more evidence and typically requires privileged access in the first place.

---

## Protective Measures

1. **Check Startup Files**:  
   - Review `~/.bashrc`, `~/.bash_profile`, `~/.zshrc`, and similar shell initialization files for **suspicious functions**.  
   - Use the **absolute path** (e.g., `/bin/netstat`) if you suspect a command override (*But it is always good to suspect that the executable may also have been counterfeited/altered*).

2. **Monitor Integrity**:  
   - Employ integrity-checking tools (e.g., Tripwire, AIDE) to detect unauthorized modifications to key configuration files.  
   - Audit your shell history and logs regularly.

3. **Educate & Train**:  
   - Inform team members about the dangers of USB-based attacks.  
   - Encourage best practices like “plugging in only trusted devices” and verifying system commands on new or unfamiliar machines.
   - Stop underestimating a “trivial” usb flash drive, it is often not so trivial... :)

---

This payload demonstrates how a **simple** alteration to `~/.bashrc` can **completely distort** the output of commonly used monitoring tools like `netstat`. With a **USB Rubber Ducky**, the attack can be performed rapidly and stealthily, highlighting the critical importance of:

- **Physical security** against unauthorized USB devices.  
- **Regular audits** of system configuration files.  
- **Awareness** of potential command overrides or aliases.

By understanding these risks and implementing proper countermeasures, administrators and users can better protect their systems from malicious intrusions.

> **Use responsibly** and **ethically**. Always obtain permission before testing any system that you do not own or manage.
