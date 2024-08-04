$text = Read-Host -prompt "What would you like to encode"
$base64Text = [Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes($text))
echo $base64Text

