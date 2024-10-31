# Exfiltrate Mac Address - MacOS

This payload is designed to retrieve the MAC address and username from a macOS system and send this information to a specified webhook.

### Details

- **Title**: Exfiltrate Mac Address
- **Author**: bst04 - Aleff
- **Version**: 1.0
- **Category**: Exfiltration
- **Target**: MacOS

### Dependencies

- Set the #WEBHOOK to complete the exfiltration
   `DEFINE #WEBHOOK example`

## How It Works 📜

1. Sets a user-defined webhook (`#WEBHOOK`) to complete the exfiltration
2. Uses an extension (`EXTENSION DETECT_READY`) to detect when the device is ready with just a littebit more delay...
3. After readiness is confirmed, the script:
   - Runs commands to open **Terminal**.
   - Acquire the mac address and the system user name
   - Send this informations through the Webhook