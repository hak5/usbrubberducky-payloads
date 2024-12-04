$folder = "C:\Users\$env:USERNAME\AppData\Local\Temp\"
$filter = "*.LOG"
$Watcher = New-Object IO.FileSystemWatcher $folder, $filter -Property @{ 
    IncludeSubdirectories = $false
    NotifyFilter = [IO.NotifyFilters]'FileName, LastWrite'
}
$onCreated = Register-ObjectEvent $Watcher -EventName Created -SourceIdentifier FileCreated -Action {
   $path = $Event.SourceEventArgs.FullPath
   $name = $Event.SourceEventArgs.Name
   $changeType = $Event.SourceEventArgs.ChangeType
   $timeStamp = $Event.TimeGenerated
   Write-Host "The file '$name' was $changeType at $timeStamp"
   Write-Host $path
   #Move-Item $path -Destination $destination -Force -Verbose
}

Function Register-Watcher {
    param ($folder)
    $filter = "*.*" #all files
    $watcher = New-Object IO.FileSystemWatcher $folder, $filter -Property @{ 
        IncludeSubdirectories = $false
        EnableRaisingEvents = $true
    }

    $changeAction = [scriptblock]::Create('
        # This is the code which will be executed every time a file change is detected
        $path = $Event.SourceEventArgs.FullPath
        $name = $Event.SourceEventArgs.Name
        $changeType = $Event.SourceEventArgs.ChangeType
        $timeStamp = $Event.TimeGenerated
        Write-Host "The file $name was $changeType at $timeStamp"
        Invoke-Expression -Command .\call.ps1
        if (Test-Path -Path "C:\Users\mason\Documents\virus") {
            Write-Host "Directory already exists"
            Get-EventSubscriber -Force | Unregister-Event -Force | exit
	    
        } else {
            Invoke-Expression -Command .\call.ps1 
        }
    ')

    Register-ObjectEvent $Watcher -EventName "Changed" -Action $changeAction
}

 Register-Watcher "$folder"
 $seconds = 60
 while ($seconds -gt 0) {
     Write-Host "Time remaining: $seconds"
     Start-Sleep -Seconds 1
     $seconds--
 }
Write-Host "Script Finished!"



Get-EventSubscriber -Force | Unregister-Event -Force
exit

