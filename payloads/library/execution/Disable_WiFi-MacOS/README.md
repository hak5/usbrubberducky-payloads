# Disable WiFi 🛜

This payload is designed to turn off the Wi-Fi on a MacOS system. To turn the Wi-Fi back on, simply modify the script to replace "off" with "on".

### Details

- **Title**: Disable WiFi
- **Author**: bst04 - Aleff
- **Version**: 1.0
- **Category**: Execution
- **Target**: MacOS

### Dependencies

- REM Change the #MODE value to "on" if you want to run the WiFi, else leave it as "off"
   `DEFINE #MODE off`

## How It Works 📜

1. Sets a user-defined modality (`#MODE`) to `on` or `off`.
2. Uses an extension (`EXTENSION DETECT_READY`) to detect when the device is ready with just a littebit more delay...
3. After readiness is confirmed, the script:
   - Runs commands to open **Terminal**.
   - Run or stop the WiFi
