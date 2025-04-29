REM TITLE: Brave_Breacher

REM AUTHOR: OSINTI4L (https://github.com/OSINTI4L)

REM TARGET OS: Linux (tested on Pop!_OS) | Brave Browser Flatpak Version: 1.77.101

REM DESCRIPTION: Brave Breacher is a side-channel attack payload that utilizes various methods to navigate the Brave Browser GUI. The payload has two phases: Phase 1, all username and password credentials stored in the browser are exported to be exfiltrated. Phase 2, the payload then navigates to the payment method settings menu and screenshots the stored payment method. The files are then moved to the /Pictures/Screenshots directory, tarballed, and then exfiltrated via Discord webhook. All files in the /Pictures/Screenshots directory are then shredded, the terminal history is cleared, and all windows opened are closed to obfuscate activity. To be functional: insert USER to lines 68/78, add Discord webhook to line 76.

![bbdemo](https://github.com/user-attachments/assets/1c0776ed-2c0f-477f-94ea-87ab4fd95066)

![loot](https://github.com/user-attachments/assets/203efd4a-0e53-48a9-9f6b-3d8bc35bd2bf)

![loott](https://github.com/user-attachments/assets/4bffc3b8-466e-46ca-a6a8-4ea988342cd4)

```
name,url,username,password,note
site1.com,https://site1.com/,user1,pass1,
site2.com,https://site2.com/,user2,pass2,
site3.com,https://site3.com/,user3,pass3,
site4.com,https://site4.com/,site4,pass4,
```
