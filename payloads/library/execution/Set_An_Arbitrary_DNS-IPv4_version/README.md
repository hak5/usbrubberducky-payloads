# Set An Arbitrary DNS (IPv4 version)

This script can be used to change the default DNS server in Windows 11.

**Category**: Execute

## Description

This script can be used to change the default DNS server in Windows 11.

The script open the settings, then go to network settings, then go to wi-fi settings, then go to hardware properties settings, the open the dns settings, then change to manual, then set the DNS server defined before, then save the settings changed and close the window.

- You must edit the DNS defining the IPv4 in the payload.txt file

```DuckyScript
REM DNS IPv4 like Cloudflare DNS 1.1.1.1
DEFINE DNS example
```