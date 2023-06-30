# :art: Using Alt codes to draw an image
* Author: Cribbit 
* Version: 1
* Target: Windows
* Category: General/Ascii
* Attackmode: HID
* Props: Korben

## :book: Description
This is a PoC of using Alt Codes to draw an image in notepad of the Hak5 cow. 
Warning this is very slow as this is all done through code. 
It is using a custom version of the TRANSLATE extension, using Numpad/Keypad keys. 
Please read the notes, to modify your language file to get this to work.

## :musical_note: Notes
You will need the define KPAD_0 to KPAD_9 in your language file:
```json
    "KPAD_SLASH":"00,00,54",
    "KPAD_ASTERISK":"00,00,55",
    "KPAD_MINUS":"00,00,56",
    "KPAD_PLUS":"00,00,57",
    "KPAD_ENTER":"00,00,58",
    "KPAD_1":"00,00,59",
    "KPAD_2":"00,00,5a",
    "KPAD_3":"00,00,5b",
    "KPAD_4":"00,00,5c",
    "KPAD_5":"00,00,5d",
    "KPAD_6":"00,00,5e",
    "KPAD_7":"00,00,5f",
    "KPAD_8":"00,00,60",
    "KPAD_9":"00,00,61",
    "KPAD_0":"00,00,62",
    "KPAD_DOT":"00,00,63",
```

It takes just over an hour to run 45 lines with 80 characters on each.
as it is holding ALT taking the number 177 getting each number using maths. Taking that number and press the corresponding key 
then taking that number away (177 - 100 = 77).

This version will not work with ZERO leading alt codes.

## :page_facing_up: Change Log
| Version | Changes                       |
| ------- | ------------------------------|
| 1.0     | Initial release               |