<# ===================== Beigeworm Global Powershell Transcription =====================

SYNOPSIS
Log all powershell input and output to a text file in the documents folder.

USAGE
1. Run once to enable logging
2. Check transcript files in 'WindowsPowerShell' in Documents folder
3. Run once more to remove logging

NOTES
Admin Permission required. (for setting execution policies and registry keys)

#>

[Console]::BackgroundColor = "Black"
[Console]::SetWindowSize(60, 20)
Clear-Host
[Console]::Title = "Powershell Logging"

Test-Path $Profile | Out-Null
$directory = Join-Path ([Environment]::GetFolderPath("MyDocuments")) WindowsPowerShell
$ps1Files = Get-ChildItem -Path $directory -Filter *.ps1
$regLocation = "HKLM:\Software\Policies\Microsoft\Windows\PowerShell"

$scriptblock = @"
`$transcriptDir = Join-Path ([Environment]::GetFolderPath("MyDocuments")) WindowsPowerShell
if (-not (Test-Path `$transcriptDir))
{
    New-Item -Type Directory `$transcriptDir
}
`$dateStamp = Get-Date -Format ((Get-culture).DateTimeFormat.SortableDateTimePattern -replace ':','.')
try 
{
    Start-Transcript "`$transcriptDir\Transcript.`$dateStamp.txt" | Out-File -FilePath "$transcriptDir\Transcripts_Logging.txt" -Append
}
catch [System.Management.Automation.PSNotSupportedException]
{
    return
} 
"@

if ($ps1Files.Count -gt 0) {
    Write-Host "Removing Powershell logging" -ForegroundColor Green
    Get-ChildItem -Path $directory -Filter *.ps1 | Remove-Item -Force
    Set-ItemProperty -Path $regLocation -Name "EnableModuleLogging" -Value 0
    Set-ItemProperty -Path $regLocation -Name "EnableScriptBlockLogging" -Value 0
}
else{
    Write-Host "Adding Powershell logging" -ForegroundColor Green
    New-Item -Path $regLocation -Force | Out-Null
    Set-ItemProperty -Path $regLocation -Name "EnableModuleLogging" -Value 1
    Set-ItemProperty -Path $regLocation -Name "EnableScriptBlockLogging" -Value 1
    $scriptblock | Out-File -FilePath $Profile -Force
    Write-Host "`nLOG FILES: $directory" -ForegroundColor Cyan
}

Write-Host "Closing Script..." -ForegroundColor Red
sleep 2
