# Silent Watcher

This is a combination of a DuckyScript payload and a virus template that I created.
To use it, compile `payload.txt` and add it to the root directory of your hotplug. BE SURE TO READ THE CODE!
Some variables are specific to your use case and you may find it in your interest to change the for your purposes.
This program is designed to work on any machine that operates on Windows 11 and higher.

# How Does It Work?

When the primed hotplug is inserted into the host machine, it will wait for "CAPSLOCK" to toggle on. This is INTENTIONAL, this is intended to be most effective as a waiting game of sorts. The program will then open a powershell window and run `event.ps1` from the virus directory in the hotplug.
When the `event.ps1` is run, it will listen for any change in the `TEMP` directory of the current user. Once a change is heard, `event.ps1` starts `call.ps1`.
`call.ps1` will then begin a chain reaction which results in `pull.ps1` being copied into "User\$yourUsername\Documents\virus\Virus" and then run.
`pull.ps1` then copies the rest of the "virus" directory of the hotplug into the newely created "Virus" directory.

# Tips

You can change this program to most use cases, should there be another directory you would prefer to listen to, change the PATH in `event.ps1` to your desired directory.
You can also change the timer in the same file to your desired time if you are more patient.
The copy directory can be changed as well by changing the PATH in both the `call.ps1` and `pull.ps1` scripts

# Disclaimer

I do not take responsibility for any malicious use of this program by others. This is a proof of concept for my own sense of accomplishment, and as such is intended only for educational use. Use this program at your own discretion!

   **The Creator**
   
   -- Mavis
