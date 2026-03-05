# NullSec System Profiler

**Author:** NullSec (bad-antics)  
**Version:** 1.0  
**Category:** Recon  
**Target:** Windows 10/11  
**Device:** USB Rubber Ducky (New)

## Description

Comprehensive system reconnaissance payload that collects detailed information about the target system including:

- **Operating System** — Version, build number, architecture, install date
- **Hardware** — CPU, RAM, disk drives, GPU
- **Network** — IP addresses, gateway, DNS, public IP, WiFi profiles with saved passwords
- **Security** — Antivirus, firewall status, UAC, BitLocker
- **Software** — Top 30 recently installed programs
- **Processes** — Top 15 processes by memory usage

All data is saved to a timestamped text file on the Ducky's mass storage (or `%TEMP%` as fallback).

## Setup

1. Ensure your Rubber Ducky's mass storage volume is labeled `DUCKY`
2. Compile and deploy the payload
3. Insert into target Windows machine

## Output

A file named `system_profile_YYYYMMDD_HHMMSS.txt` will be saved to the Ducky drive containing the full system report.

## Notes

- Cleans up PowerShell history after execution
- Runs in a hidden PowerShell window
- No external dependencies required
- For authorized penetration testing only
