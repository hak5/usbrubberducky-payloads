# Export all saved certificates with Adobe Reader

This script can be used to export all PFX certificates saved in plain text and without any protection from Adobe Reader.

**Category**: Exfiltration

## Description

This script can be used to export all PFX certificates saved in plain text and without any protection from Adobe Reader.

Open a PowerShell, go to Adobe Reader Path dinamically, then select all the pfx certificates, then set the exfiltration settings and export the certificates trough a foreach using Dropbox.

**The unauthorized extraction of PFX certificates can be considered a criminal offense**. Taking possession of such certificates, which contain sensitive information such as private keys and critical authentication data, violates the owner's property rights.

## Dependencies

* Adobe Reader must be installed
* Internet Connection

## Settings

- You must define your Dropbox accessToken or modify the exfiltration modality. Replace just the example word with your token.

    `DEFINE DROPBOX_ACCESS_TOKEN "example"`