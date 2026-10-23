
REM TITLE: MOAA (Mother Of All Annoyances)

REM AUTHOR: OSINTI4L (https://github.com/OSINTI4L)

REM TARGET OS: Linux (tested on Pop!_OS)

## Description:
MOAA will perform multiple tasks on the target machine to ensure that the user is annoyed as possible.

## Dependencies:
`xdotool` (for mouse movement) and `gnome environment` (for terminal window spawning).

### Actions performed by the USB Ducky device:
The Ducky device will perform the following tasks (in addition to initial payload injection) via a loop (until unplugged):
  1. CAPSLOCK enable/disable.
  2. NUMLOCK enable/disable.
  3. Up arrow key movement.
  4. Down arrow key movement.

They Ducky will also create a hidden script (explained below) inside of the users' home directory and assign key aliases to the `.bashrc` file (which will cause the aliases to persist between terminal sessions).

### The .MOAA.sh script:
The .MOAA Bash script (written by the Ducky) will perform the following actions:
  1. Toggle the WiFi radio on and off.
  2. Teleport the mouse pointer around the screen.

The script is saved inside of the users home directory and is "hidden" by prepending the script with a `.` During initial creation, the terminal history is unset to allow obfuscation of the script being written.

### Key alises:
The key aliases are appended to the `.basrc` file, so that they will persist on new terminal sessions. The key binds perform the following:
  1. The `pwd` command will return "command not found" to the terminal.
  2. The `exit` command will NOT exit the window, but will spawn a new terminal window, endlessly spwaning new terminal windows when a user tries to exit the terminal.
  3. The `ls` command will execute the .MOAA.sh script hidden in the users' home directory (this will trigger the toggling of the WiFi radio and the teleportation of the mouse pointer).

### How to stop the annoyance:
  1. To stop .MOAA.sh script from continuing to execute (once executed by the `ls` command, perform the following in terminal: `ps aux | grep -i MOAA.sh` and `kill` the associated processes. Then close the terminal by using the mouse.
  2. To stop the CAPSLOCK, NUMLOCK, and arrow key movement, simply disconnect the USB RubberDucky.

### Artifact removal:
To remove the artifacts left behind by the payload:
  1. Remove the .MOAA script via: `rm -f ~/.MOAA.sh`
  2. Correct the `.bashrc` file via: `nano ~/.bashrc`, scroll down to the bottom of the file, and remove the alias key binds.

The machine is now "cleaned"
