<h2 align="center"> Discord and Powershell Command Line Interface (CLI) </h2>

**SYNOPSIS**

Gain a reverse shell on a target Windows PC using Discord's bot API as a command and control server.


**WHY?**

I developed this Powershell one-liner to be as short as possible while also being able to receive commands from a Discord channel, and return the output to that channel in chunks of up to 1900 characters. (Discord's limit is 2000 per message)

*Use the hidden version to hide the running console window from the user on windows 10 and 11!*


**USAGE**

*Make sure your bot has the correct permissions and intents enabled*

1. Replace `your-bot-token-here` on line 9 with your Discord bot token.
1. Replace `your-channel-id-here` on line 10 with the channel ID of the channel you want to use.
2. Run the bad-USB on a target.
3. Your specified channel should be ready for commands.. Try `whoami` to test the connection is working! 


**THIS SCRIPT IS INTENDED FOR USE ON SYSTEMS YOU OWN OR HAVE BEEN GIVEN PERMISSION TO USE!**
