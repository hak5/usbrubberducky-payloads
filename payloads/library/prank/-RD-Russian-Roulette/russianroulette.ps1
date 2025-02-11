#Sets Volume to Max
function Set-Volume {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [ValidateRange(0,100)]
        [int]
        $volume
    )
    $keypresses = [Math]::Ceiling($volume / 2)
    $obj = New-Object -ComObject WScript.Shell

    for($i = 0; $i -lt $keypresses; $i++)
    {
        $obj.SendKeys([char]175)
    }
}

#Waits for user to move mouse
function WaitForUser {
    Add-Type -AssemblyName System.Windows.Forms
    $ogPOS = [System.Windows.Forms.Cursor]::Position.X
    $caps = New-Object -ComObject WScript.Shell

    while(1){
        $pauseTime = 3
        if([Windows.Forms.Cursor]::Position.X -ne $ogPOS)
        {
            break
        } else {
            $caps.SendKeys("{CAPLOCK}");Start-Sleep -Seconds $pauseTime
        }
    }
}

#Has computer talk
function Talk {
    [CmdletBinding()]
    param(
        [Parameter (Position=0,Mandatory = $True,ValueFromPipeline=$true)]
        [String] $sentence
    )
    $s.Voice = $s.GetVoices().Item(0)
    $s=New-Object -ComObject SAPI.SpVoice
    $s.Rate = 2
    $s.Speak($sentence)
}

function RussianRoulette {
    [CmdletBinding()]
    param (
        [int] $chamber,
        [array] $rounds
    )
    #Picks a random number as the bullet
    $chamber = Get-Random -Minimum 1 -Maximum 6
    $rounds = @(1, 2, 3, 4, 5, 6)
    for($i = 0; $i -lt 5; $i++)
    {
        #Checks if the user enetered a value from 1-6
        while(-not ($rounds -contains $inputValue)){
            Add-Type -AssemblyName System.Windows.Forms
            #Pop up
            $form = New-Object System.Windows.Forms.Form
            $form.Text = 'Russian Roulette'
            $form.Size = New-Object System.Drawing.Size(300, 200)
            $form.StartPosition = 'CenterScreen'
            
            $label = New-Object System.Windows.Forms.Label
            $label.Text = 'Pick a number that is listed, one of them will infect your computer: ' + $rounds
            $label.Size = New-Object System.Drawing.Size(280,30)
            $label.Location = New-Object System.Drawing.Point(10, 10)
            $form.Controls.Add($label)
            
            $textBox = New-Object System.Windows.Forms.TextBox
            $textBox.Location = New-Object System.Drawing.Point(10, 50)
            $textBox.Width = 260
            $form.Controls.Add($textBox)
            
            $okButton = New-Object System.Windows.Forms.Button
            $okButton.Text = 'OK'
            $okButton.Location = New-Object System.Drawing.Point(10, 80)
            $okButton.DialogResult = 'OK'
            $form.Controls.Add($okButton)
            
            $result = $form.ShowDialog()
            
            if ($result -eq 'OK') {
                $inputValue = $textBox.Text
            }
        }
        if($inputValue -eq $chamber){
            #Ends game and rickrolls user
            Talk "Game Over, Installing Virus"
            Start-Sleep -Seconds 5
            Set-Volume 100
            Start-Process chrome.exe  https://www.youtube.com/watch?v=2qBlE2-WL60 -WindowStyle Maximized
            break
        } else {
            $newChamber = foreach ($item in $rounds){
                if($item -ne $inputValue){
                    $item
                }
            }
            $rounds = $newChamber
            $rounds
        }
    }
}

$ErrorActionPreference = "SilentlyContinue"
WaitForUser
Set-Volume 100
Talk "Listen to me or a deadly virus will infect your computer. I want to play a game. If you Refuse to play your system will be infected with a deadly virus"
Talk "The game is simple, You might have seen it in the movies called Russian Roulette"
Talk "I will pick a number from 1 to 6 which will infect your computer with the virus and you must figure out which of the other 5 numbers are safe"
Talk "You have a minute to finish the game or I will force the virus to infect your computer. Begin"
RussianRoulette
