Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Create a bitmap that covers all screens
$allScreens = [System.Windows.Forms.Screen]::AllScreens
$width = 0
$height = 0

# Calculate the total width and height of all screens
foreach ($screen in $allScreens) {
    $width += $screen.Bounds.Width
    $height = [Math]::Max($height, $screen.Bounds.Height)
}

# Create a bitmap of the total size
$bitmap = New-Object System.Drawing.Bitmap $width, $height

# Create a graphics object from the bitmap
$graphics = [System.Drawing.Graphics]::FromImage($bitmap)

# Capture each screen
$xOffset = 0
foreach ($screen in $allScreens) {
    $graphics.CopyFromScreen($screen.Bounds.Location, [System.Drawing.Point]::new($xOffset, 0), $screen.Bounds.Size)
    $xOffset += $screen.Bounds.Width
}

# Save the screenshot to a file
$savePath = "./DesktopScreenShot.png"  # Change this to your desired path
$bitmap.Save($savePath, [System.Drawing.Imaging.ImageFormat]::Png)

# Clean up
$graphics.Dispose()
$bitmap.Dispose()
