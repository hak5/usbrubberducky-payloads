# :mag: Invisible Desktop Folder
* Author: Cribbit 
* Version: 1
* Target: Windows 10 (English)
* Category: Execution
* Attackmode: HID

## :book: Description
Creates a somewhat invisible folder on the desktop.
Uses an invisible character for the name and a transparent icon.
This targets the English version of Windows. as it uses the underlined letters to select menu items and buttons.

## :musical_note: Notes
You will need the define KPAD_2 and KPAD_5 in your language file:
```JSON
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


## :page_facing_up: Change Log
| Version | Changes                       |
| ------- | ------------------------------|
| 1.0     | Initial release               |