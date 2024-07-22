# WiFi Passwords Exfiltration via SCP

## Author: zb0r
## Version: 1.0

Welcome to the WiFi Passwords Exfiltration via SCP payload! This payload is designed to find WiFi SSIDs and passwords on a Windows machine, save them to a file, and then exfiltrate the file to your VPS using SCP. It's a handy tool for white-hat penetration testers or anyone needing to gather WiFi credentials for legitimate purposes.

### How It Works

1. **Windows Detection**: The script checks if it's running on a Windows machine.
2. **PowerShell Execution**: It opens PowerShell in admin mode.
3. **WiFi Profiles and Passwords**: The script retrieves all WiFi profiles and their respective passwords from the machine.
4. **Save to File**: It saves this information to a text file in the temporary directory.
5. **Exfiltrate via SCP**: The file is then securely copied to your VPS using SCP.

### Prerequisites

1. **A VPS**: You'll need a VPS where you can receive the exfiltrated file. If you don't have one, you can set up a simple Linux VPS on platforms like DigitalOcean, AWS, or any provider of your choice.
2. **Modify the Script**: Before running the payload, replace the placeholder values for the VPS username, password, and IP address with your actual VPS details.

```plaintext
DEFINE #VPS_IP your_vps_ip
DEFINE #VPS_USER your_vps_username
DEFINE #VPS_PASS your_vps_password
Script Breakdown
The script includes the following key parts:
Open PowerShell: Opens PowerShell in admin mode.
Retrieve WiFi Profiles: Runs netsh wlan show profiles to list all WiFi profiles.
Get WiFi Passwords: Retrieves the password for each profile by running netsh wlan show profile name=$profile key=clear.
Save to File: Saves the collected information to a text file in the temporary directory.
Securely Copy via SCP: Uses SCP with the -o StrictHostKeyChecking=no option to automatically accept new host keys and copies the file to the specified directory on the VPS.
Usage Instructions
Prepare the Script: Edit the script to include your VPS details.
Deploy the Payload: Run the script on the target Windows machine.
Check Your VPS: The WiFi credentials file should be securely transferred to your VPS.
Disclaimer
This script is intended for educational purposes and legitimate use only. Unauthorized use of this script on devices you do not own or have explicit permission to test is illegal and unethical. Always ensure you have proper authorization before running any penetration testing tools or scripts.
Enjoy and happy testing!
