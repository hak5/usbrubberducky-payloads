# Exfiltrates the entire database of the Notion client

This script can be used to exfiltrate the entire Notion database and thus all client-level content of your Notion account.

**Category**: Exfiltration

## Description

This script can be used to exfiltrate the entire Notion database and thus all client-level content of your Notion account.

Open a PowerShell, the get dinamically the Notion full-path and then add the `notion.db` string. Then create all the needed variables for the exfiltration and then send it trough Dropbox. I used Dropbox but you can use whatever you want.

## Dependencies

* Notion must be installed
* Internet Connection

## Settings

- You must define your Dropbox accessToken or modify the exfiltration modality. Replace just the example word with your token.

`DEFINE DROPBOX_ACCESS_TOKEN "example"`