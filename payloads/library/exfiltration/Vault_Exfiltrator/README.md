# Vault Exfiltrator - Password Manager File Exfiltrator 

## Description
Scans for password manager database files and exfiltrates them via Rubber Ducky to demonstrate data exposure vulnerabilities.

## Requirements
- Rubber Ducky.
- Windows target system.

## Setup Instructions

### 1. Configure the Payload
- Edit the Duckyscript payload to match your USB drive label, ensure `'DUCKY'` in the script matches your actual drive label.

### 3. Encode and Deploy
- Encode the Duckyscript to `inject.bin` using PayloadStudio.
- Copy `inject.bin` to your Rubber Ducky.

## Features
- **Physical Exfiltration**: Direct USB-based data extraction.
- **Multi-Manager Support**: Targets 8+ popular password managers.

## Warning
**FOR AUTHORIZED PENETRATION TESTING AND EDUCATIONAL PURPOSES ONLY**

- Use only on systems you own or have explicit written permission to test.