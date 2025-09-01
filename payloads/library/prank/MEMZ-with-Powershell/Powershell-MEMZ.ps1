<# ================================================ POWERSHELL MEMZ PRANK ========================================================

SYNOPSIS
This script displays various screen effects similar to the classic MEMZ trojan (Non-Destructive).
Also randomly plays the Windows Chord.wav sound endlessly

USAGE
1. Run the script.
2. Hold down the Escape key for 5 seconds to exit the script.

#>

# Hide the powershell console (1 = yes)
$hide = 1

# Code to hide the console on Windows 10 and 11
if ($hide -eq 1){
    $Async = '[DllImport("user32.dll")] public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);'
    $Type = Add-Type -MemberDefinition $Async -name Win32ShowWindowAsync -namespace Win32Functions -PassThru
    $hwnd = (Get-Process -PID $pid).MainWindowHandle
    
    if ($hwnd -ne [System.IntPtr]::Zero) {
        $Type::ShowWindowAsync($hwnd, 0)
    }
    else {
        $Host.UI.RawUI.WindowTitle = 'hideme'
        $Proc = (Get-Process | Where-Object { $_.MainWindowTitle -eq 'hideme' })
        $hwnd = $Proc.MainWindowHandle
        $Type::ShowWindowAsync($hwnd, 0)
    }
}

# Create the balloon popup (bottom right)
$baloonPopup = {
    Add-Type -AssemblyName System.Drawing
    Add-Type -AssemblyName System.Windows.Forms
    $notify = New-Object System.Windows.Forms.NotifyIcon
    $notify.Icon = [System.Drawing.SystemIcons]::Warning
    $notify.Visible = $true
    $balloonTipTitle = "System Error (0x00060066e)"
    $balloonTipText = "WARNING! - System Breach Detected"
    $notify.ShowBalloonTip(30000, $balloonTipTitle, $balloonTipText, [System.Windows.Forms.ToolTipIcon]::WARNING)
}

# Paint error icons wherever the mouse is located
$errorIcons = {
    Add-Type -AssemblyName System.Drawing
    Add-Type -AssemblyName System.Windows.Forms  
    $desktopHandle = [System.IntPtr]::Zero
    $graphics = [System.Drawing.Graphics]::FromHwnd($desktopHandle)
    $icon = [System.Drawing.Icon]::ExtractAssociatedIcon("C:\Windows\System32\DFDWiz.exe")  
    function Get-MousePosition {
        $point = [System.Windows.Forms.Cursor]::Position
        return $point
    }   
    while ($true) {
        $mousePosition = Get-MousePosition
        $graphics.DrawIcon($icon, $mousePosition.X, $mousePosition.Y)
        Start-Sleep -Milliseconds 50
    }
    $graphics.Clear([System.Drawing.Color]::Transparent)
    $graphics.Dispose()
    $icon.Dispose()
}

# Take a snapshot of the desktop and paste blocks in random places
$screenBlocks = {
    Add-Type -AssemblyName System.Windows.Forms
    Add-Type -AssemblyName System.Drawing
    $File = "$env:temp\screen.png"
    $Screen = [System.Windows.Forms.SystemInformation]::VirtualScreen
    $Width = $Screen.Width
    $Height = $Screen.Height
    $Left = $Screen.Left
    $Top = $Screen.Top
    $bitmap = New-Object System.Drawing.Bitmap $Width, $Height
    $graphic = [System.Drawing.Graphics]::FromImage($bitmap)
    $graphic.CopyFromScreen($Left, $Top, 0, 0, $bitmap.Size)
    $bitmap.Save($File, [System.Drawing.Imaging.ImageFormat]::png)
    $savedImage = [System.Drawing.Image]::FromFile($File)
    $desktopHandle = [System.IntPtr]::Zero
    $graphics = [System.Drawing.Graphics]::FromHwnd($desktopHandle)
    $random = New-Object System.Random    
    function Get-RandomSize {
        return $random.Next(100, 500)
    }    
    function Get-RandomPosition {
        param ([int]$rectWidth,[int]$rectHeight)
        $x = $random.Next(0, $Width - $rectWidth)
        $y = $random.Next(0, $Height - $rectHeight)
        return [PSCustomObject]@{X = $x; Y = $y}
    }
    function Invert-Colors {
        param ([System.Drawing.Bitmap]$bitmap,[System.Drawing.Rectangle]$rect)
        for ($x = $rect.X; $x -lt $rect.X + $rect.Width; $x++) {
            for ($y = $rect.Y; $y -lt $rect.Y + $rect.Height; $y++) {
                $pixelColor = $bitmap.GetPixel($x, $y)
                $invertedColor = [System.Drawing.Color]::FromArgb(255, 255 - $pixelColor.R, 255 - $pixelColor.G, 255 - $pixelColor.B)
                $bitmap.SetPixel($x, $y, $invertedColor)
            }
        }
    }
    while ($true) {
        $rectWidth = Get-RandomSize
        $rectHeight = Get-RandomSize
        $srcX = $random.Next(0, $savedImage.Width - $rectWidth)
        $srcY = $random.Next(0, $savedImage.Height - $rectHeight)
        $destPosition = Get-RandomPosition -rectWidth $rectWidth -rectHeight $rectHeight
        $srcRect = New-Object System.Drawing.Rectangle $srcX, $srcY, $rectWidth, $rectHeight
        $destRect = New-Object System.Drawing.Rectangle $destPosition.X, $destPosition.Y, $rectWidth, $rectHeight
        $graphics.DrawImage($savedImage, $destRect, $srcRect, [System.Drawing.GraphicsUnit]::Pixel)
        Start-Sleep -M 50
        $rectWidth = Get-RandomSize
        $rectHeight = Get-RandomSize
        $srcX = $random.Next(0, $savedImage.Width - $rectWidth)
        $srcY = $random.Next(0, $savedImage.Height - $rectHeight)
        $destPosition = Get-RandomPosition -rectWidth $rectWidth -rectHeight $rectHeight
        $srcRect = New-Object System.Drawing.Rectangle $srcX, $srcY, $rectWidth, $rectHeight
        $destRect = New-Object System.Drawing.Rectangle $destPosition.X, $destPosition.Y, $rectWidth, $rectHeight
        $srcBitmap = $savedImage.Clone($srcRect, $savedImage.PixelFormat)
        Invert-Colors -bitmap $srcBitmap -rect (New-Object System.Drawing.Rectangle 0, 0, $rectWidth, $rectHeight)
        $graphics.DrawImage($srcBitmap, $destRect)
        $srcBitmap.Dispose()
        Start-Sleep -M 50
    }    
    $savedImage.Dispose()
    $graphics.Dispose()
    $bitmap.Dispose()
    $graphic.Dispose()
}

# Spam the Windows chord sound randomly
$SoundSpam = {
    $i = 250
    $random = New-Object System.Random
    while($true){
        Get-ChildItem C:\Windows\Media\ -File -Filter *hor*.wav | Select-Object -ExpandProperty Name | Foreach-Object { 
            Start-Sleep -M $i
            (New-Object Media.SoundPlayer "C:\WINDOWS\Media\$_").Play()
        }
        $i = $random.Next(100, 300)
    }
}

# Display "SYSTEM FAIL!" messages in random sizes everywhere
$failMessage = {
    Add-Type -AssemblyName System.Drawing
    Add-Type -AssemblyName System.Windows.Forms
    $screen = [System.Windows.Forms.Screen]::PrimaryScreen
    $Width = $screen.Bounds.Width
    $Height = $screen.Bounds.Height
    $desktopHandle = [System.IntPtr]::Zero
    $graphics = [System.Drawing.Graphics]::FromHwnd($desktopHandle)
    $random = New-Object System.Random
    function Get-RandomFontSize {
        return $random.Next(20, 101)
    }
    function Get-RandomPosition {
        param ([int]$textWidth,[int]$textHeight)
        $x = $random.Next(0, $Width - $textWidth)
        $y = $random.Next(0, $Height - $textHeight)
        return [PSCustomObject]@{X = $x; Y = $y}
    }
    $text = "SYSTEM FAIL!"
    $textColor = [System.Drawing.Color]::Red
    while ($true) {
        $fontSize = Get-RandomFontSize
        $font = New-Object System.Drawing.Font("Arial", $fontSize, [System.Drawing.FontStyle]::Bold)
        $textSize = $graphics.MeasureString($text, $font)
        $textWidth = [math]::Ceiling($textSize.Width)
        $textHeight = [math]::Ceiling($textSize.Height)
        $position = Get-RandomPosition -textWidth $textWidth -textHeight $textHeight
        $graphics.DrawString($text, $font, (New-Object System.Drawing.SolidBrush($textColor)), $position.X, $position.Y)
        $font.Dispose()
        Start-Sleep -M 250
    }
}

# Take a snapshot of the desktop and shrink towards the center
$screenmelt = {
Add-Type -AssemblyName System.Drawing
Add-Type -AssemblyName System.Windows.Forms 
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public class NativeMethods {
    [DllImport("user32.dll", SetLastError = true)]
    public static extern IntPtr GetDC(IntPtr hWnd);
    [DllImport("gdi32.dll", SetLastError = true)]
    public static extern IntPtr CreateCompatibleDC(IntPtr hdc);
    [DllImport("gdi32.dll", SetLastError = true)]
    public static extern IntPtr CreateCompatibleBitmap(IntPtr hdc, int nWidth, int nHeight);
    [DllImport("gdi32.dll", SetLastError = true)]
    public static extern IntPtr SelectObject(IntPtr hdc, IntPtr hgdiobj);
    [DllImport("gdi32.dll", SetLastError = true)]
    public static extern bool BitBlt(IntPtr hdcDest, int nXDest, int nYDest, int nWidth, int nHeight,
                                     IntPtr hdcSrc, int nXSrc, int nYSrc, uint dwRop);
    [DllImport("gdi32.dll", SetLastError = true)]
    public static extern bool DeleteDC(IntPtr hdc);
    [DllImport("user32.dll", SetLastError = true)]
    public static extern bool ReleaseDC(IntPtr hWnd, IntPtr hDC);
    [DllImport("gdi32.dll", SetLastError = true)]
    public static extern bool DeleteObject(IntPtr hObject);
    public const int SRCCOPY = 0x00CC0020;
}
"@
    
    $Screen = [System.Windows.Forms.SystemInformation]::VirtualScreen
    $Width = $Screen.Width
    $Height = $Screen.Height
    $Left = $Screen.Left
    $Top = $Screen.Top
    $desktopDC = [NativeMethods]::GetDC([IntPtr]::Zero)
    $memDC = [NativeMethods]::CreateCompatibleDC($desktopDC)
    $bitmap = [NativeMethods]::CreateCompatibleBitmap($desktopDC, $Width, $Height)
    [NativeMethods]::SelectObject($memDC, $bitmap)
    [NativeMethods]::BitBlt($memDC, 0, 0, $Width, $Height, $desktopDC, $Left, $Top, [NativeMethods]::SRCCOPY)
    $fallSpeed = 20
    $shrinkFactor = 0.96
    while($true){
        $currentOffsetX1 = 0
        $currentOffsetY1 = 0
        $currentWidth1 = $Width
        $currentHeight1 = $Height
        $currentOffsetX2 = $Width
        $currentOffsetY2 = $Height
        $currentWidth2 = $Width
        $currentHeight2 = $Height
        while ($currentOffsetX1 -lt $Width -and $currentOffsetY1 -lt $Height -and
               $currentOffsetX2 -gt 0 -and $currentOffsetY2 -gt 0) {
            $currentWidth1 = [math]::floor($currentWidth1 * $shrinkFactor)
            $currentHeight1 = [math]::floor($currentHeight1 * $shrinkFactor)
            $currentWidth2 = [math]::floor($currentWidth2 * $shrinkFactor)
            $currentHeight2 = [math]::floor($currentHeight2 * $shrinkFactor)
            [NativeMethods]::BitBlt($desktopDC, $currentOffsetX1, $currentOffsetY1, $currentWidth1, $currentHeight1,
                                    $memDC, 0, 0, [NativeMethods]::SRCCOPY)
            [NativeMethods]::BitBlt($desktopDC, $currentOffsetX2 - $currentWidth2, $currentOffsetY2 - $currentHeight2, $currentWidth2, $currentHeight2,
                                    $memDC, 0, 0, [NativeMethods]::SRCCOPY)
            $currentOffsetX1 += $fallSpeed
            $currentOffsetY1 += $fallSpeed
            $currentOffsetX2 -= $fallSpeed
            $currentOffsetY2 -= $fallSpeed
            Start-Sleep -Milliseconds 100
        }
    }
    [NativeMethods]::DeleteDC($memDC)
    [NativeMethods]::ReleaseDC([IntPtr]::Zero, $desktopDC)
    [NativeMethods]::DeleteObject($bitmap)
}

# Start jobs intermitently
sleep 5
Start-Job -ScriptBlock $baloonPopup
Start-Job -ScriptBlock $errorIcons
sleep 10
Start-Job -ScriptBlock $screenBlocks
sleep 5
Start-Job -ScriptBlock $SoundSpam
Start-Job -ScriptBlock $failMessage
sleep 5
Start-Job -ScriptBlock $screenmelt

# Exit the script when the Escape key is held down for 5 seconds or more
Add-Type @"
using System;
using System.Runtime.InteropServices;
public class Keyboard{
    [DllImport("user32.dll")]
    public static extern short GetAsyncKeyState(int vKey);
}

"@
$VK_ESCAPE = 0x1B
$startTime = $null
while ($true) {
    Start-Sleep -M 100
    $isEscapePressed = [Keyboard]::GetAsyncKeyState($VK_ESCAPE) -lt 0
    if ($isEscapePressed) {
        if (-not $startTime) {
            $startTime = Get-Date
        }
        $elapsedTime = (Get-Date) - $startTime
        if ($elapsedTime.TotalSeconds -ge 5) {
            exit
        }
    } else {
        $startTime = $null
    }
}