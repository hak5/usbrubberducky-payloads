# Windows netstat ✅

A script used to stole target netstat status.

**Category**: Net, Exfiltration

## Description

This script will stole target netstat status.

Opens PowerShell hidden, grabs netstat status, saves as a cleartext in a variable and exfiltrates info via Discord Webhook.

Then it cleans up traces of what you have done after.

## Getting Started

### Dependencies

* An internet connection
* Windows 10,11

### Executing program

* Plug in your device
* Invoke the indicated commands 
* Invoke-WebRequest will be entered in the Run Box to send the content

### Settings
Put 1 on the function that you want to active, else 0.
Functions available:
- default (*or simple 'netstat' command*)
- routing_table **$r**
- listening_canonical **$lc**
- listening_numerical **$ln**
- all_canonical **$ac**
- all_numerical **$an**
- offload **ot**
- proto **$p "\<protocol>"**
    - *In this option you must put the protocol that you want to monitor, for example $proto="TCP" if you want to monitor TCP, else leave blank, so $proto="".*


