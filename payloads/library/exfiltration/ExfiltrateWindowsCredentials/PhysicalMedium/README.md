# Exfiltration of Windows Credentials over a Physical Medium

Script to dump Windows Credentials using mimikatz and exfiltrate sensitive information over a physical medium.

**Category**: Credentials, Exfiltration

## Description

This script creates a memory dump of the lsass.exe process using the TaskManager, downloads and uses mimikatz to extract credentials from the dump file and exfiltrates data to the SSD storage of the USB Rubber Ducky. The exfiltrated data is stored in a folder with the name of the computer that is attacked. 

Cleanup is performed after the exfiltration is completed. This cleanup includes the removal of temporary files and the deletion of the PowerShell history on line 116.

## Getting Started

### Dependencies

* Permission to Attack
* Internet Connection
* Webserver hosting mimikatz.exe

### Settings

* Set the server URL for your webserver