# Exfiltration of Windows Credentials using Keystroke Reflection

Script to dump Windows Credentials using mimikatz and exfiltrate sensitive information using keystroke reflection.

**Category**: Credentials, Exfiltration

## Description

This script creates a memory dump of the lsass.exe process using the TaskManager, downloads and uses mimikatz to extract credentials from the dump file and exfiltrates data using keystroke reflection to a file on the USB Rubber Ducky. For more information about keystroke reflection, click [here](https://shop.hak5.org/pages/keystroke-reflection?srsltid=AfmBOophL1ZvvnOASWmd7Stb2XP1OteANu-6b0FsPoCPYPe2aihVp3TU). 

Cleanup is performed after the exfiltration is completed. This cleanup includes the removal of temporary files and the deletion of the PowerShell history on line 121.

## Getting Started

### Dependencies

* Permission to Attack
* Internet Connection
* Webserver hosting mimikatz.exe

### Settings

* Set the server URL for your webserver