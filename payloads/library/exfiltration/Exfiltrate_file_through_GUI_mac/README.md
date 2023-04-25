# Exfiltrate Files Through GUI - MacOS

 Copies files with a certain name to ducky 

 **Category**: Exfiltration
 
 ## Description

 A script used to open the finder, look for files with a certain name, then copy them all onto the Ducky

## Getting Started

 ### Dependencies

 * None (That is the beauty of it)

 ### Executing program

 * Plug in your device

 ### Settings

 * Here you can define what files you want the ducky to look for. Note that the more matches there are the longer it will take to copy.

 ```DuckyScript
 DEFINE #target the_filename_you_want.txt
 ```

 * The main `DELAY` points in this script are before tabing 4 times to access the `DUCKY` USB as it is very random how long it takes (in my testing on an m1 pro 3-6 seconds) to show up and the one after the `COMMMAND v` which has to be adjusted depening on how generic the file name looked for it.

Delay for USB to show up:
```DuckyScript
REM This can take annoyingly long to show up which is why the delay is so big
DELAY 6000

REM Go to first result
DO_TABS()
```

Delay for how long the file copying takes:
 ```DuckyScript
REM Paste the copied files. As this may take a few seconds given on how many results there were there is a long delay
COMMAND v
DELAY 7000
 ```
 
 https://user-images.githubusercontent.com/69253692/230636177-ca9c5931-44ee-43a2-addc-4ee7f7fb0d62.mov
