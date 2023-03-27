# Exfiltrate Process Info - Windows ✅

A script used to exfiltrate process info.

**Category**: Exfiltration

## Description

A script used to exfiltrate process info.

This function uploads the content of a file called "tasklist_output.txt" to Dropbox using Dropbox API.

Firstly, a temporary file is created using the New-TemporaryFile cmdlet of PowerShell.

Then, the tasklist /v command is used to get the running processes output on the computer.

The output is then written to the temporary file using the Out-File cmdlet.

The Dropbox API endpoint for uploading a file is set, and the API parameters such as the destination path of the file on Dropbox and access credentials are specified.

Finally, the Invoke-RestMethod cmdlet of PowerShell is used to send an HTTP POST request to the Dropbox API and upload the file.

## Getting Started

### Dependencies

* An internet connection
* Windows 10,11

### Executing program

* Plug in your device

### Settings

* Dropbox Webhook