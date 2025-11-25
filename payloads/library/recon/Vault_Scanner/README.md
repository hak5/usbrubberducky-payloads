# Vault Scanner - Password Manager File Collector

## Description
Scans for password manager database files and sends findings to Discord webhook.

## Requirements
- Discord webhook URL
- Web server to host `Vault_Scanner.ps1`

## Setup Instructions

### 1. Configure Server Script
- Edit `Vault_Scanner.ps1` and replace `WEBHOOK_URL_PLACEHOLDER` with your Discord webhook
- Host the script on your web server (Apache, Nginx, Python HTTP server)

### 2. Configure Payload
- Edit `payload.txt` and replace `example.com` with your actual server URL
- Encode to `inject.bin` using PayloadStudio

### 3. Deploy
- Copy `inject.bin` to your Rubber Ducky
- Insert into target system

## Features
- Scans for 10+ password managers vaults
- Sends results to Discord in chunks

## Warning
For authorized penetration testing and educational purposes only.