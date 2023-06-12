# Clipboard-Creep #
Clipboard-Creep is a basic script which tracks the users clipboard and exfiltrates it contents. It was created to get access to passwords copied out of password managers, but might be useful in general.


## Usage ##
### #HOOK ###
Define your webhook under #HOOK

### #CALLBACK_DELAY ###
Define a timer under #CALLBACK_DELAY. This defines the pause between calls to your webhook. A default of 12 seconds was choosen to capture potential passwords, in clipboards of password managers.

After successful execution you'll see the contents of your targets clipboard or simply signs of life flying into your webhook. 
![alt text](https://github.com/0iphor13/usbrubberducky-payloads/blob/master/payloads/library/exfiltration/ClipBoard-Creep/media/clippy.png)
