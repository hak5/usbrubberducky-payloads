#The-Perfect-Stealthy-Payload

**Author:** zb0r  
**Version:** 1.0

## Description
Welcome to the mischievous world of the "Cache Folder Exclusion & Payload Download + Persistence" payload! This payload is like a digital ninja, sneaking into Windows systems, creating a safe haven in the `Windows/temp` folder called `Cache`, adding a sneaky exclusion in Windows Defender, downloading a payload from a VPS, executing it, and ensuring it stays persistent by adding itself to the startup. It's designed to evade most Endpoint Detection and Response (EDR) systems. Just remember, the delay is set for dramatic effect (and testing purposes) but can be sped up to unleash the ninja faster.

## Target
**Operating System:** Windows

## Note
- **Stealth Mode:** This payload is designed to fly under the radar of most EDRs.
- **Customizable Speed:** The delays are set for testing; you can reduce them for a quicker execution.

## Payload Steps
1. **Initial Delay:** Give the system a moment to recognize the USB Rubber Ducky.
2. **Open PowerShell as Admin:** Trigger the `Run` dialog, type `powershell`, and execute it with administrative privileges.
3. **Create Cache Folder:** Make a new folder named `Cache` in the `Windows/temp` directory.
4. **Defender Exclusion:** Add the `Cache` folder to Windows Defender exclusions via registry manipulation.
5. **Download Payload:** Use `Invoke-WebRequest` to download the payload into the `Cache` folder.
6. **Execute Payload:** Run the downloaded payload.
7. **Persistence:** Add the payload to startup, ensuring it runs every time the system boots.

