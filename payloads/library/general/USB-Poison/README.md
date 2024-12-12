<h2 align="center"> USB Poison </h2>

**SYNOPSIS**

This script waits for new USB flash storage devices to be connected.
When a new device connects, this script will copy a desired file to the root of newly connected drive.


**WHY?**

I developed this Powershell one-liner to spread a malicious file stored alongside the script to be copied when USB flash drives are connected to a Windows system.

Imitating part of the attack chain for this attack in 2023

> https://www.pcmag.com/news/china-linked-malware-spotted-infecting-usb-drives-to-spread-attack

*Use the hidden version to hide the running console window from the user on windows 10 and 11!*


**USAGE**

1. Replace `path/to/your/file.exe` on line 10 with the local path to your file to copy.
2. Run the bad-USB on a target.
3. When any new USB storage device is detected, it will copy the specified file to the USB folder root. 


**THIS SCRIPT IS INTENDED FOR USE ON SYSTEMS YOU OWN OR HAVE BEEN GIVEN PERMISSION TO USE!**
