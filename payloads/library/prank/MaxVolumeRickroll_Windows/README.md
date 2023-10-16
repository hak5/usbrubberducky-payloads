# Max Volume Rickroll

## Description

Runs following oneliner in Windows Run:
```PowerShell
powershell $obj = New-Object -ComObject WScript.Shell;  1..50 | ForEach-Object {  $obj.SendKeys( [char] 175 )  }; Start-Process 'https://www.youtube.com/watch?v=xvFZjo5PgG0&autoplay=1'
```

Turns up the volume of **Windows 10/11** computer to **100%** and opens **rickroll** in the default browser

## Requirements

- Windows 10/11
- Internet connection (to open rickroll)
- US Keyboard Layout (to turn up the volume, not tested with other layouts)

## Check me out

https://github.com/P-ict0
