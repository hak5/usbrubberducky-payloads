dir $HOME\Desktop\* | Rename-Item -NewName { $_.name.substring(0,$_.name.length-10) }
dir $HOME\pictures\wallpaper.ratl0ck3r | Rename-Item -NewName { $_.name.substring(0,$_.name.length-10) }
dir $HOME\pictures\wallpaper | Rename-Item -NewName {$_.name - ".jpg"}
