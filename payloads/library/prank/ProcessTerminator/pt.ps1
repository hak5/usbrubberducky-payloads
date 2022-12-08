while (1) {
    $ws = Get-Process | Where-Object { $_.MainWindowHandle -ne 0 }
    foreach ($w in $ws) {
        if ($w.ProcessName -ne 'explorer' -and $w.Id -ne $PID) {
            $w.CloseMainWindow()
        }
    }
    Start-Sleep -Seconds 1
}
