# Image over key reflection
- Author: Cribbit
- Version: 1.0
- Target: Windows (Powershell 5.1+)
- Category: exfiltration
- Attackmode: HID then Storage

## Change Log
| Version | Changes         |
| ------- | --------------- |
| 1.0     | Initial release |

## Description
Proof of concept for send an image over key reflection using two methods of converting bytes to key presses.

## Config
Un-REM the method to try. And place and image at the C:\Users\{Current user}\test.jpg. 
The smaller image the better a file of 807 bytes took about 7 mins.

## Props
To Darren and Korban for all the hard work they have put in to new ducky & key reflection. And for answering my questions i had about the ducky before i had it.
To I am Jakoby for shorting the System.Windows.Forms bit