# :flashlight: Pixel Reflection
- Author: Cribbit
- Version: 1.0
- Target: Windows 10
- Category: Exfiltration
- Attackmode: HID

## :book: Description
Creates a 1 pixel sized form in the top left of the screen and changes the background to black or white to represent the bits of a file.

Inspired by Hak5’s Keystroke Reflection, xyzzy in Minesweeper (if you know you know) and tales of a BBC show – may have been Micro Live that uses to send programs by flashing a square in the corner of the screen and user of the BBC micro b holding their light pen to read the in coming data.

## :musical_note: notes
This is a proof of concept as I don’t really have a way to decode the data.

If you wanted it to me less noticeable you could take a screen shot read the top pixel colour. Up or down the RGB or alpha values and uses this. So, the colour is only slightly different

Included is the test image I used this need to by in the users directory or update the #FILE define to a new file.
There are other difines for speed, size and location on screen.


## :placard: Change Log
| Version | Changes         |
| ------- | --------------- |
| 1.0     | Initial release |
