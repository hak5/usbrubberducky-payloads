
## Disclaimer

This script is provided "as is" without any warranty of any kind, either express or implied. The use of this script is at your own risk. The author is not responsible for any damage or loss of data that may occur as a result of using this script. By using this script, you agree to these terms.

## About:
A badUSB script that gains full admin access to a windows machine from the login screen.

## Important Note:
This script currently only works on computer with one account.

### How it works:
1. It boots into safe mode
2. It opens a cmd from safe mode
3. It changes the Utilman.exe to be a cmd.exe
4. It boots back into windows
5. It opens the help menu which has been replaced with a cmd instance
6. It creates a new admin account named ```rubberDucky``` with the password ```1234```
7. it Reboots again, to register the new account
8. It logs into the new account