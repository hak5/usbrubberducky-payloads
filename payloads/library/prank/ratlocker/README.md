# Ratlocker (.ratl0ck3r)

This is a prank payload created by ratcode404(.github.io). It's use is to create a fake malware, locking files but keeping settings stored for easy recovering.

```
            ____()()
           /      OO
      ~~~~~\_;m__m._>o
```

The ratlocker adds ratcode file extensions, draws and sets background without the use of URLs or image download (avoid proxy blocking and detection). The original wallpaper will be backuped on \pictures\wallpaper.ratl0ck3r, so no files will be lost. The current setup only targets the files and folder structures on $HOME\Desktop\, but it could be easily extended by adjusting the path variable further down.

![message](https://i.imgur.com/KYMRr9f.png)  
  
![fakelock](https://i.imgur.com/MBIQdDR.png)

## Why ratl0ck3r
There are multiple reasons why ratl0ck3r is the best ducky-locker around to this date:

* Requires no internet connection or proxy by-pass: Pictures are not downloaded or added to the stick in weird, wonky ways but rather drawn with commandline itself. All it needs is pre-installed Windows tools.
* Easy recovering: All files (inclusive the changed background/wallpaper) are easily recovered in less than a few seconds, no family photo backgrounds will be ever lost; promise!
* Unbreakable: I have been using this exact setup for weeks to annoy people who do not lock their devices. It has not broken a single time.
* Runtime: The whole script finishes in less than 7.5 seconds, just plug it in, whistle a nice tune and be gone already.

## Requirements:
- Windows (7/8/8.1/10)
- Unlocked device
- No internet connection or proxy by-pass is needed as the wallpaper will be created in script

## Recovering
Obviously, there is no key or tool needed to recover. All you have to do is to remove the .ratl0ck3r extention before the .original one and everything works again. The background will be stored in \pictures\wallpaper.ratl0ck3r to avoid accidential removial of any important backgrounds or family photos!

To quick-recover you can use this powershell command, but it's much more fun to watch them to it by hand:  
`dir $HOME\Desktop\* | Rename-Item -NewName { $_.name.substring(0,$_.name.length-10) }`

The rat3ncrypt3er.bat does run this command and renames the wallpaper located in \pictures\ back to a .jpg, before one could set it as a background once again.

