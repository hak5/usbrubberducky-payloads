$uploadUrl = "https://content.dropboxapi.com/2/files/upload"
    
$dropboxFilePath = "path/to/file"

$headers = @{}
$headers.Add("Authorization", "Bearer $accessToken")
$headers.Add("Dropbox-API-Arg", '{"path":"' + $dropboxFilePath + '","mode":"add","autorename":true,"mute":false}')
$headers.Add("Content-Type", "application/octet-stream")

Invoke-RestMethod -Uri $uploadUrl -Headers $headers -Method Post -Body $dropboxFilePath