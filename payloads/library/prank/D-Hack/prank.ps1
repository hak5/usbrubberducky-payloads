$duration = 30  #Prank duration
$interval = 2   #Delay between popup cycles
$popupsPerCycle = 6  #Delay between popup cycles
$maxActiveJobs = 12  #Maximum number of active popups

# Sound settings
$enableSounds = $true  #System sounds
$soundChancePercent = 100  #Sound frequency

$endTime = (Get-Date).AddSeconds($duration)
$counter = 0
$jobPrefix = "PrankPopup-"

#Loading-bar messages
$loadingPhrases = @(
    "BYPASSING FIREWALL...",
    "BREACH IN PROGRESS...",
    "INSTALLING VIRUS...",
    "DOWNLOADING DATA..."
)

#Regular pop-ups phrases
$alertPhrases = @(
    "HACKED",
    "VIRUS DETECTED",
    "SYSTEM COMPROMISED",
    "ALERT",
    "SECURITY ALERT: DATA AT RISK",
    "CRITICAL SECURITY BREACH",
    "YOUR IP HAS BEEN EXPOSED",
    "WARNING: UNAUTHORIZED ACCESS DETECTED",
    "MALICIOUS ACTIVITY DETECTED"
)

#Emojis
$emojis = @(
    "💀",
    "🪼",
    "🐱"
)

#Popup colors
$colors = @(
    "GreenYellow",
    "Black",
    "HotPink"
)

$icons = @(
    "Information",
    "Warning",
    "Error"
)

# Built-in Windows sounds
$sounds = @(
    "Asterisk",
    "Beep",
    "Exclamation",
    "Hand",
    "Question"
)

# Get jobs created by this script
function Get-PrankJobs {
    @(
        Get-Job -ErrorAction SilentlyContinue |
            Where-Object {
                $_.Name -like "$jobPrefix*"
            }
    )
}

function Get-RunningPrankJobs {
    @(
        Get-PrankJobs |
            Where-Object {
                $_.State -eq "Running"
            }
    )
}

function Get-RunningPrankJobCount {
    @(Get-RunningPrankJobs).Count
}

function Remove-FinishedPrankJobs {
    Get-PrankJobs |
        Where-Object {
            $_.State -in @(
                "Completed",
                "Failed",
                "Stopped"
            )
        } |
        Remove-Job -Force -ErrorAction SilentlyContinue
}

# Removes jobs left from an earlier run
Get-RunningPrankJobs |
    Stop-Job -ErrorAction SilentlyContinue

Get-PrankJobs |
    Remove-Job -Force -ErrorAction SilentlyContinue

# Loading-bar popup
$loadingPopupScript = {
    param(
        $Title,
        $Message,
        $DurationSeconds,
        $BackColor,
        $Width,
        $Height,
        $IconName,
        $SoundName
    )

    Add-Type -AssemblyName System.Windows.Forms
    Add-Type -AssemblyName System.Drawing

    $form = New-Object System.Windows.Forms.Form
    $form.Text = $Title
    $form.ClientSize = New-Object System.Drawing.Size(
        $Width,
        $Height
    )
    $form.StartPosition = "Manual"
    $form.BackColor = [System.Drawing.Color]::$BackColor
    $form.TopMost = $true
    $form.ShowInTaskbar = $false
    $form.FormBorderStyle = "FixedDialog"
    $form.MaximizeBox = $false
    $form.MinimizeBox = $false

    $form.Icon = switch ($IconName) {
        "Error" {
            [System.Drawing.SystemIcons]::Error
        }

        "Warning" {
            [System.Drawing.SystemIcons]::Warning
        }

        default {
            [System.Drawing.SystemIcons]::Information
        }
    }

    $screen = [System.Windows.Forms.Screen]::PrimaryScreen.WorkingArea

    $maximumX = [Math]::Max(
        $screen.Right - $form.Width,
        $screen.Left + 1
    )

    $maximumY = [Math]::Max(
        $screen.Bottom - $form.Height,
        $screen.Top + 1
    )

    $randomX = Get-Random `
        -Minimum $screen.Left `
        -Maximum $maximumX

    $randomY = Get-Random `
        -Minimum $screen.Top `
        -Maximum $maximumY

    $form.Location = New-Object System.Drawing.Point(
        $randomX,
        $randomY
    )

    $innerWidth = $Width - 20

    $textColor = if (
        $BackColor -in @(
            "GreenYellow",
            "HotPink"
        )
    ) {
        [System.Drawing.Color]::Black
    }
    else {
        [System.Drawing.Color]::White
    }

    $label = New-Object System.Windows.Forms.Label
    $label.Text = $Message
    $label.ForeColor = $textColor
    $label.BackColor = [System.Drawing.Color]::Transparent
    $label.Font = New-Object System.Drawing.Font(
        "Segoe UI",
        12,
        [System.Drawing.FontStyle]::Bold
    )
    $label.AutoSize = $false
    $label.Size = New-Object System.Drawing.Size(
        $innerWidth,
        35
    )
    $label.Location = New-Object System.Drawing.Point(10, 15)
    $label.TextAlign = "MiddleCenter"

    $form.Controls.Add($label)

    $progressBar = New-Object System.Windows.Forms.ProgressBar
    $progressBar.Location = New-Object System.Drawing.Point(10, 60)
    $progressBar.Size = New-Object System.Drawing.Size(
        $innerWidth,
        25
    )
    $progressBar.Minimum = 0
    $progressBar.Maximum = 100
    $progressBar.Value = 0
    $progressBar.Style = "Blocks"

    $form.Controls.Add($progressBar)

    try {
        $form.Show()
        $form.Activate()

        try {
            switch ($SoundName) {
                "Asterisk" {
                    [System.Media.SystemSounds]::Asterisk.Play()
                }

                "Beep" {
                    [System.Media.SystemSounds]::Beep.Play()
                }

                "Exclamation" {
                    [System.Media.SystemSounds]::Exclamation.Play()
                }

                "Hand" {
                    [System.Media.SystemSounds]::Hand.Play()
                }

                "Question" {
                    [System.Media.SystemSounds]::Question.Play()
                }
            }
        }
        catch {
            # Ignore sound errors
        }

        $stopwatch = [System.Diagnostics.Stopwatch]::StartNew()

        $durationMilliseconds = [Math]::Max(
            $DurationSeconds * 1000,
            1
        )

        while (
            $stopwatch.ElapsedMilliseconds -lt $durationMilliseconds -and
            -not $form.IsDisposed -and
            $form.Visible
        ) {
            $percentage = [int](
                (
                    $stopwatch.ElapsedMilliseconds /
                    $durationMilliseconds
                ) * 100
            )

            $progressBar.Value = [Math]::Min(
                $percentage,
                100
            )

            [System.Windows.Forms.Application]::DoEvents()
            Start-Sleep -Milliseconds 20
        }

        if (
            -not $form.IsDisposed -and
            -not $progressBar.IsDisposed -and
            $form.Visible
        ) {
            $progressBar.Value = 100
            [System.Windows.Forms.Application]::DoEvents()
            Start-Sleep -Milliseconds 100
        }
    }
    catch {
        # Close quietly if interrupted
    }
    finally {
        if (-not $form.IsDisposed) {
            $form.Close()
        }

        if (-not $progressBar.IsDisposed) {
            $progressBar.Dispose()
        }

        if (-not $label.IsDisposed) {
            $label.Dispose()
        }

        if (-not $form.IsDisposed) {
            $form.Dispose()
        }
    }
}

# Regular popup
$colorPopupScript = {
    param(
        $Title,
        $Message,
        $BackColor,
        $Width,
        $Height,
        $IconName,
        $SoundName
    )

    Add-Type -AssemblyName System.Windows.Forms
    Add-Type -AssemblyName System.Drawing

    $form = New-Object System.Windows.Forms.Form
    $form.Text = $Title
    $form.ClientSize = New-Object System.Drawing.Size(
        $Width,
        $Height
    )
    $form.StartPosition = "Manual"
    $form.BackColor = [System.Drawing.Color]::$BackColor
    $form.TopMost = $true
    $form.ShowInTaskbar = $false
    $form.FormBorderStyle = "FixedDialog"
    $form.MaximizeBox = $false
    $form.MinimizeBox = $false

    $form.Icon = switch ($IconName) {
        "Error" {
            [System.Drawing.SystemIcons]::Error
        }

        "Warning" {
            [System.Drawing.SystemIcons]::Warning
        }

        default {
            [System.Drawing.SystemIcons]::Information
        }
    }

    $screen = [System.Windows.Forms.Screen]::PrimaryScreen.WorkingArea

    $maximumX = [Math]::Max(
        $screen.Right - $form.Width,
        $screen.Left + 1
    )

    $maximumY = [Math]::Max(
        $screen.Bottom - $form.Height,
        $screen.Top + 1
    )

    $randomX = Get-Random `
        -Minimum $screen.Left `
        -Maximum $maximumX

    $randomY = Get-Random `
        -Minimum $screen.Top `
        -Maximum $maximumY

    $form.Location = New-Object System.Drawing.Point(
        $randomX,
        $randomY
    )

    $innerWidth = $Width - 20

    $labelHeight = [Math]::Max(
        $Height - 60,
        40
    )

    $textColor = if (
        $BackColor -in @(
            "GreenYellow",
            "HotPink"
        )
    ) {
        [System.Drawing.Color]::Black
    }
    else {
        [System.Drawing.Color]::White
    }

    $label = New-Object System.Windows.Forms.Label
    $label.Text = $Message
    $label.ForeColor = $textColor
    $label.BackColor = [System.Drawing.Color]::Transparent
    $label.Font = New-Object System.Drawing.Font(
        "Segoe UI",
        10,
        [System.Drawing.FontStyle]::Bold
    )
    $label.AutoSize = $false
    $label.Size = New-Object System.Drawing.Size(
        $innerWidth,
        $labelHeight
    )
    $label.Location = New-Object System.Drawing.Point(10, 5)
    $label.TextAlign = "MiddleCenter"

    $form.Controls.Add($label)

    $button = New-Object System.Windows.Forms.Button
    $button.Text = "LOL"
    $button.Size = New-Object System.Drawing.Size(75, 25)

    $buttonX = [int](($Width - $button.Width) / 2)
    $buttonY = $Height - $button.Height - 10

    $button.Location = New-Object System.Drawing.Point(
        $buttonX,
        $buttonY
    )

    $button.Add_Click({
        $form.Close()
    })

    $form.Controls.Add($button)

    try {
        $form.Show()
        $form.Activate()

        try {
            switch ($SoundName) {
                "Asterisk" {
                    [System.Media.SystemSounds]::Asterisk.Play()
                }

                "Beep" {
                    [System.Media.SystemSounds]::Beep.Play()
                }

                "Exclamation" {
                    [System.Media.SystemSounds]::Exclamation.Play()
                }

                "Hand" {
                    [System.Media.SystemSounds]::Hand.Play()
                }

                "Question" {
                    [System.Media.SystemSounds]::Question.Play()
                }
            }
        }
        catch {
            # Ignore sound errors
        }

        $stopwatch = [System.Diagnostics.Stopwatch]::StartNew()

        while (
            $stopwatch.ElapsedMilliseconds -lt 3000 -and
            -not $form.IsDisposed -and
            $form.Visible
        ) {
            [System.Windows.Forms.Application]::DoEvents()
            Start-Sleep -Milliseconds 20
        }
    }
    catch {
        # Close quietly if interrupted
    }
    finally {
        if (-not $form.IsDisposed) {
            $form.Close()
        }

        if (-not $button.IsDisposed) {
            $button.Dispose()
        }

        if (-not $label.IsDisposed) {
            $label.Dispose()
        }

        if (-not $form.IsDisposed) {
            $form.Dispose()
        }
    }
}

#emoji popup
$emojiPopupScript = {
    param(
        $Emoji,
        $SoundName
    )

    Add-Type -AssemblyName System.Windows.Forms
    Add-Type -AssemblyName System.Drawing

    $formSize = 400
    $fontSize = 160

    $form = New-Object System.Windows.Forms.Form
    $form.ClientSize = New-Object System.Drawing.Size(
        $formSize,
        $formSize
    )
    $form.StartPosition = "Manual"
    $form.FormBorderStyle = "None"
    $form.ShowInTaskbar = $false
    $form.BackColor = [System.Drawing.Color]::Magenta
    $form.TransparencyKey = [System.Drawing.Color]::Magenta
    $form.TopMost = $true

    $screen = [System.Windows.Forms.Screen]::PrimaryScreen.WorkingArea

    $maximumX = [Math]::Max(
        $screen.Right - $formSize,
        $screen.Left + 1
    )

    $maximumY = [Math]::Max(
        $screen.Bottom - $formSize,
        $screen.Top + 1
    )

    $randomX = Get-Random `
        -Minimum $screen.Left `
        -Maximum $maximumX

    $randomY = Get-Random `
        -Minimum $screen.Top `
        -Maximum $maximumY

    $form.Location = New-Object System.Drawing.Point(
        $randomX,
        $randomY
    )

    $label = New-Object System.Windows.Forms.Label
    $label.Text = $Emoji
    $label.Font = New-Object System.Drawing.Font(
        "Segoe UI Emoji",
        $fontSize
    )
    $label.AutoSize = $false
    $label.Size = New-Object System.Drawing.Size(
        $formSize,
        $formSize
    )
    $label.Location = New-Object System.Drawing.Point(0, 0)
    $label.TextAlign = "MiddleCenter"
    $label.BackColor = [System.Drawing.Color]::Transparent

    $form.Controls.Add($label)

    try {
        $form.Show()
        $form.Activate()

        try {
            switch ($SoundName) {
                "Asterisk" {
                    [System.Media.SystemSounds]::Asterisk.Play()
                }

                "Beep" {
                    [System.Media.SystemSounds]::Beep.Play()
                }

                "Exclamation" {
                    [System.Media.SystemSounds]::Exclamation.Play()
                }

                "Hand" {
                    [System.Media.SystemSounds]::Hand.Play()
                }

                "Question" {
                    [System.Media.SystemSounds]::Question.Play()
                }
            }
        }
        catch {
            # Ignore sound errors
        }

        $stopwatch = [System.Diagnostics.Stopwatch]::StartNew()

        while (
            $stopwatch.ElapsedMilliseconds -lt 2000 -and
            -not $form.IsDisposed -and
            $form.Visible
        ) {
            [System.Windows.Forms.Application]::DoEvents()
            Start-Sleep -Milliseconds 20
        }
    }
    catch {
        # Close quietly if interrupted
    }
    finally {
        if (-not $form.IsDisposed) {
            $form.Close()
        }

        if (-not $label.IsDisposed) {
            $label.Dispose()
        }

        if (-not $form.IsDisposed) {
            $form.Dispose()
        }
    }
}

# Main loop
while ((Get-Date) -lt $endTime) {
    for ($i = 1; $i -le $popupsPerCycle; $i++) {

        while (
            (Get-RunningPrankJobCount) -ge $maxActiveJobs
        ) {
            Start-Sleep -Milliseconds 200
            Remove-FinishedPrankJobs
        }

        $counter++

        $jobName = "$jobPrefix$counter"
        $randomColor = Get-Random -InputObject $colors
        $randomIcon = Get-Random -InputObject $icons

        $randomWidth = Get-Random `
            -Minimum 240 `
            -Maximum 451

        $randomHeight = Get-Random `
            -Minimum 120 `
            -Maximum 251

        # Decide whether this popup should make a sound
        $randomSound = "None"

        if (
            $enableSounds -and
            (Get-Random -Minimum 1 -Maximum 101) -le $soundChancePercent
        ) {
            $randomSound = Get-Random -InputObject $sounds
        }

        $popupType = Get-Random -InputObject @(
            "Alert",
            "Loading",
            "Emoji"
        )

        switch ($popupType) {
            "Alert" {
                $randomPhrase = Get-Random -InputObject $alertPhrases

                Start-Job `
                    -Name $jobName `
                    -ScriptBlock $colorPopupScript `
                    -ArgumentList @(
                        "Security Alert",
                        $randomPhrase,
                        $randomColor,
                        $randomWidth,
                        $randomHeight,
                        $randomIcon,
                        $randomSound
                    ) |
                    Out-Null
            }

            "Loading" {
                $loadingHeight = [Math]::Max(
                    $randomHeight,
                    120
                )

                $randomPhrase = Get-Random -InputObject $loadingPhrases

                Start-Job `
                    -Name $jobName `
                    -ScriptBlock $loadingPopupScript `
                    -ArgumentList @(
                        "Loading",
                        $randomPhrase,
                        5,
                        $randomColor,
                        $randomWidth,
                        $loadingHeight,
                        $randomIcon,
                        $randomSound
                    ) |
                    Out-Null
            }

            "Emoji" {
                $randomEmoji = Get-Random -InputObject $emojis

                Start-Job `
                    -Name $jobName `
                    -ScriptBlock $emojiPopupScript `
                    -ArgumentList @(
                        $randomEmoji,
                        $randomSound
                    ) |
                    Out-Null
            }
        }
    }

    Start-Sleep -Seconds $interval
    Remove-FinishedPrankJobs
}

# Wait for popup to finish normally
$waitUntil = (Get-Date).AddSeconds(12)

while (
    (Get-RunningPrankJobCount) -gt 0 -and
    (Get-Date) -lt $waitUntil
) {
    Start-Sleep -Milliseconds 300
    Remove-FinishedPrankJobs
}

# Stop remaining popup jobs
Get-RunningPrankJobs |
    Stop-Job -ErrorAction SilentlyContinue

# Remove all jobs created by this script
Get-PrankJobs |
    Remove-Job -Force -ErrorAction SilentlyContinue

# Final prank reveal
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$owner = New-Object System.Windows.Forms.Form
$owner.ClientSize = New-Object System.Drawing.Size(1, 1)
$owner.StartPosition = "CenterScreen"
$owner.FormBorderStyle = "None"
$owner.ShowInTaskbar = $false
$owner.TopMost = $true
$owner.Opacity = 0

$owner.Show()
$owner.Activate()

[System.Windows.Forms.Application]::DoEvents()

try {
    [System.Media.SystemSounds]::Exclamation.Play()
}
catch {
    # Ignore sound errors
}

[System.Windows.Forms.MessageBox]::Show(
    $owner,
    "You have been pranked!",
    "Prank Complete",
    [System.Windows.Forms.MessageBoxButtons]::OK,
    [System.Windows.Forms.MessageBoxIcon]::Information
) | Out-Null

$owner.Close()
$owner.Dispose()