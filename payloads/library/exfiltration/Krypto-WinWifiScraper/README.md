> **Hardware:** USB Rubber Ducky  
> **Tested Status:** Verified Working (Q3 2026)

---

## 📌 Overview

The **Windows WiFi Scraper** payload is an automated administrative auditing script designed for the **USB Rubber Ducky**. It scans the target host for stored Wi-Fi profile configurations, retrieves known SSIDs alongside their associated authentication credentials for the active user session, and exports the collected audit log directly to the Rubber Ducky storage.

---

## ⚙️ Technical Specifications

| Parameter | Details |
| :--- | :--- |
| **Payload Name** | Windows WiFi Scraper |
| **Version** | 1.0 |
| **Target Architecture** | Windows 11 / Legacy Windows (PowerShell 2.0+) |
| **Deployment Mode** | Plug-and-Play (Out-of-the-Box) |
| **Primary Use Case** | Wireless Network Security Auditing & Compliance |

---

## 🚀 Deployment Considerations

* **Plug-and-Play Compatibility:** Ready for immediate deployment out-of-the-box.
* **System Delays:** Depending on the hardware specifications, background processing load, or typing speed limitations of the target machine, default execution delays (`DELAY` / `DEFAULT_DELAY`) may need fine-tuning to ensure reliable keystroke delivery.

---

## 🔒 Administrative & Security Notice

This payload serves as a rapid configuration auditor for system administrators to assess wireless profile exposure and credential storage integrity across enterprise network endpoints.