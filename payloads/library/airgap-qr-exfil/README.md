# Airgap QR Exfil – Rubber Ducky Payload

**Author:** Alessandro  
**Device:** Hak5 USB Rubber Ducky (USB-C/A)  
**Platform:** Windows  
**Category:** Exfiltration / Airgap

## 🎯 Description

This payload exfiltrates clipboard data along with the current username, hostname, and timestamp via a QR code — **without requiring any internet connection from the target machine**.

It is designed for **air-gapped environments**, using PowerShell to generate a data string, encode it in Base64, and open a QR code in the browser. The attacker scans the QR code using a smartphone, decodes the data, and retrieves the sensitive information.

## ✅ Features

- No internet required on target machine
- Works on locked-down systems with PowerShell enabled
- Leaves no file on disk
- Avoids antivirus/network detection
- Perfect for Red Team or physical security audits

## 🧠 Data collected

- Clipboard contents
- Username
- Hostname
- Timestamp (YYYY-MM-DD HH:mm:ss)

## 💻 How it works

1. Reads data from clipboard and system
2. Constructs a single exfil string
3. Base64 encodes and URL-encodes the result
4. Opens a QR generator site with the encoded string
5. Attacker scans the QR and decodes the Base64 manually

## 📷 Optional improvements

- Save screenshot of desktop
- Offline QR code generation
- Loop-based clipboard sampling

## ⚠️ Disclaimer

This payload is intended for **educational and authorized use only**.  
Do **not** deploy on systems without **explicit permission**.

## 🏁 Submission

To submit to the Hak5 Payload Awards:
- Fork or submit a PR to: https://github.com/hak5/usbrubberducky-payloads
- Or upload your repo and link it via: https://shop.hak5.org/pages/payload-awards
