Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Create a bitmap of the size of the screen
$screen = [System.Windows.Forms.Screen]::PrimaryScreen
$bitmap = New-Object System.Drawing.Bitmap $screen.Bounds.Width, $screen.Bounds.Height

# Create a graphics object from the bitmap
$graphics = [System.Drawing.Graphics]::FromImage($bitmap)

# Take the screenshot
$graphics.CopyFromScreen($screen.Bounds.Location, [System.Drawing.Point]::Empty, $screen.Bounds.Size)

# Save the screenshot to a file
$savePath = "./DesktopScreenshot.png"  # Change this to your desired path
$bitmap.Save($savePath, [System.Drawing.Imaging.ImageFormat]::Png)

# Clean up
$graphics.Dispose()
$bitmap.Dispose()
