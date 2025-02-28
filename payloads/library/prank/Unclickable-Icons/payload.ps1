Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$bounds = [Windows.Forms.SystemInformation]::VirtualScreen
$screenshot = [Drawing.Bitmap]::new($bounds.Width, $bounds.Height)
$graph = [Drawing.Graphics]::FromImage($screenshot)
$graph.CopyFromScreen($bounds.X, $bounds.Y, 0, 0, $bounds.Size)
$screenshot.Save(".\screenshot.png")

