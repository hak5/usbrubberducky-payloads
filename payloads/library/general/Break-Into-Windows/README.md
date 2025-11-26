
## Disclaimer

This script is provided "as is" without any warranty of any kind, either express or implied. The use of this script is at your own risk. The author is not responsible for any damage or loss of data that may occur as a result of using this script. By using this script, you agree to these terms.

### If you found [this repository](https://github.com/TzurSoffer/WindowsPasswordBypasser) useful, please give it a ⭐!.

## Showcase

[Watch showcase video on youtube](https://www.youtube.com/shorts/1XvC-QQdRzU)

## About:
A badUSB script that gains full admin access to a windows machine from the login screen.

**IMPORTANT NOTE**: This only works on machines with a local account; if you use an account connected to Microsoft, this will not work!

## Note for pico-ducky
You might have to remove the following line as its not supported by the pico-ducky, but worry, the code should work just fine without it. ```EXTENSION PASSIVE_WINDOWS_DETECT```

### How it works:
1. It reboots into safe mode
2. It opens a cmd from safe mode
3. It changes the Utilman.exe to be a cmd.exe
4. It boots back into windows
5. It opens the help menu which has been replaced with a cmd instance
6. It creates a new admin account named ```rubberDucky``` with the password ```1234```
7. It logs into the new account
