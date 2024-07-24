# Duckie-Harvest
## Overview

This script is designed for penetration testing purposes and offers the following functionalities:

- **Dump Wi-Fi Passwords**: Extracts and saves all Wi-Fi passwords stored on the target machine.
- **Dump Browser Credentials**: Extracts saved credentials from Google Chrome, Brave, Firefox, and Microsoft Edge.
- **System Information**: Collects and dumps comprehensive system information, including network configurations and active processes.
- **Network Configuration**: Gathers detailed network configuration data and performs a network scan.
- **Reverse Shell**: Initiates a reverse shell to provide remote command-line access (requires configuration of the attacker IP and attacker port).

This payload is intended for use with a USB Rubber Ducky device.

## Usage

### Prerequisites

- **USB Rubber Ducky**: Ensure you have a USB Rubber Ducky device.
- **Powershell**: The target machine must have Powershell installed.

### Configuration

1. **Configure drive name**:
   edit the powershell script to set the name of your drive
   
   ```powershell
   $DRIVE = 'DUCKY'
2. **Configure Attacker IP and Port**:
   Edit the powershell script to set your attacker's IP address and port for the reverse shell connection:
   
   ```powershell
   $IP = 'YOUR_IP'
   $PORT = 'YOUR_PORT'

3. **Configure drive and powershell script name **:
   edit the payload.txt to set both the name of the drive label and the powershell script

   ```Duckyscript
   DEFINE #DUCKY_DRIVER_LABEL DUCKY
   DEFINE #PS1 sy_cred.ps1
   
