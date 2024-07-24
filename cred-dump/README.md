# USB Rubber Ducky Payload

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

1. **Configure Attacker IP and Port**:
   Edit the script to set your attacker's IP address and port for the reverse shell connection:
   ```powershell
   $ip = 'YOUR_IP'
   $port = 'YOUR_PORT'
### Dump Browser Credentials 

In order to obtain teh clear passwords you will need a decription program like : https://github.com/nic005-arch/Browser-password-decryption-tool
