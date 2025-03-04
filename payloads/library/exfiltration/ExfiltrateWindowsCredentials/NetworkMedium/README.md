# Exfiltration of Windows Credentials over a Network Medium

Script to dump Windows Credentials using mimikatz and exfiltrate sensitive information to a webserver.

**Category**: Credentials, Exfiltration

## Description

This script creates a memory dump of the lsass.exe process using the TaskManager, downloads and uses mimikatz to extract credentials from the dump file and exfiltrates compressed data to a remote webserver over a network. Cleanup is performed after the exfiltration is completed.

Cleanup is performed after the exfiltration is completed. This cleanup includes the removal of temporary files and the deletion of the PowerShell history on line 121.

## Getting Started

### Dependencies

* Permission to Attack
* Internet Connection
* Webserver hosting mimikatz.exe
* Webserver for receiving the exfiltrated data ([server.py](./server.py))

### Settings

* Set the URL for your webserver
* Set the URL for the webserver that receives the exfiltrated data