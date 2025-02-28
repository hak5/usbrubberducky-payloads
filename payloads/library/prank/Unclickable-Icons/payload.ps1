void][reflection.assembly]::loadwithpartialname("system.windows.forms")
$DemoScreenshot = [System.Windows.Forms.SystemInformation]::VirtualScreen
$WIDTH = $DemoScreenshot.Width
$HEIGHT = $DemoScreenshot.Height
$LEFTDIM = $DemoScreenshot.Left
$TOPDIM = $DemoScreenshot.Top

[Reflection.Assembly]::LoadWithPartialName("System.Drawing")
function screenshot([Drawing.Rectangle]$bounds, $path) {
   $bmp = New-Object Drawing.Bitmap $bounds.width, $bounds.height
   $graphics = [Drawing.Graphics]::FromImage($bmp)
   
   $graphics.CopyFromScreen($bounds.Location, [Drawing.Point]::Empty, $bounds.size)
   
   $bmp.Save($path)
   
   $graphics.Dispose()
   $bmp.Dispose()
}

$bounds = [Drawing.Rectangle]::FromLTRB(0, 0, $WIDTH, $HEIGHT)
screenshot $bounds "./DesktopScreenShot.png" 

