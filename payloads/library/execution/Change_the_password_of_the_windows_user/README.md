# Change the password of the windows user

Through this script you will be able to change windows user's password super fast.

**Category**: Execute

## Description

Through this script you will be able to change windows user's password super fast.

A PowerShell with administrator permissions is started, and through the use of the `net` command you can change the password without necessarily having to know the original password.

It is always very fascinating to see how many things you can do on Windows systems without needing to know the original password. As fascinating as it is disturbing.

## Dependencies

* Nothing (i know it's absurd)

## Example

- `STRINGLN Get-ExecutionPolicy -List`
![](docs/1.png)

- `STRINGLN Set-ExecutionPolicy Bypass`
![](docs/2.png)

- `STRINGLN Get-ExecutionPolicy -List`
![](docs/3.png)