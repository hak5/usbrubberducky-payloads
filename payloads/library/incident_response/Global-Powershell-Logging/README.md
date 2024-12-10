<h2 align="center"> Global Powershell Logging and Transcription </h2>

**SYNOPSIS**

Log all Powershell input and output from each PS process to a text file in the `Documents/WindowsPowerShell` folder.


**WHY?**

I developed this small Powershell script to quickly setup PS transcription and log all future Powershell process transcripts. Useful for recording any PS activity on Windows systems.


**USAGE**

1. Replace `https://yourserver.com/rawfile/Global-Powershell-Logging.ps1` on line 9 with the URL to your own hosted .ps1 script
2. Run once to enable logging
3. Check transcript files in `Documents/WindowsPowerShell` folder
4. Run once more to remove logging


**NOTE**

Admin Permissions required for setting execution policies and registry keys.

**THIS SCRIPT IS INTENDED FOR USE ON SYSTEMS YOU OWN OR HAVE BEEN GIVEN PERMISSION TO USE!**
