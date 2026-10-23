**Title: PingZhellDucky**

<p>Author: 0i41E<br>
OS: Windows & Unix<br>
Version: 1.2<br>
Requirements: DuckyScript 3.0, perl</p>

**What is PingZhellDucky?**
#
*Imagine a scenario in which communication to and from the server is protected and filtered by a firewall and does not allow TCP shell communication to take place on any listening port (both reverse and bind TCP connection).*
*But many environments allow ping requests to be sent and received. Ping requests work on the ICMP protocol.*
*ICMP stands for Internet Control Message Protocol; it is used by network devices’ query and error messages. ICMP differs from the widely used TCP and UDP protocols because ICMP is not used for transferring data between network devices.*
*When a device wants to test connectivity to another device, it uses the PING tool (ICMP communication) to send an ECHO REQUEST and waits for an ECHO RESPONSE.*
*The client ICMP agent listens for ICMP packets from a specific host and uses the data in the packet for command execution.*
*The server ICMP agent (PingZhellDucky.pl) sends ICMP packets to connect to the victim running a custom ICMP agent (PingZhellDucky input) and sends it commands to execute.*
#
After PingZhellCable and PingZhellBunny, PingZhellDucky released. But what is different? PZD gives you the option to set up the infrastructre when not used on a Windows machine (perl and elevated privs required).

**Instruction Version 1:**

With automatic setup:
Define INSTALL and set it to TRUE & Leave CLIENTLINK with default or choose your own
![alt text](https://github.com/0i41E/usbrubberducky-payloads/blob/master/payloads/library/remote_access/PingZhellDucky/media/setupauto.png)

Define the IP of your attacking machine between the quotes at the ATTACKER section
![alt text](https://github.com/0i41E/usbrubberducky-payloads/blob/master/payloads/library/remote_access/PingZhellDucky/media/ip.png)

Open up a terminal and put it into focus. Insert the Ducky into your non-Windows attack machine - wait for it to finish setup (Linux recommended - Perl required!)
![alt text](https://github.com/0i41E/usbrubberducky-payloads/blob/master/payloads/library/remote_access/PingZhellDucky/media/setup.png)

Start the client -> `perl PingZhellDucky.pl`
![alt text](https://github.com/0i41E/usbrubberducky-payloads/blob/master/payloads/library/remote_access/PingZhellDucky/media/Client.png)

<p>Plug your Ducky into a Windows target.<br>
Achieve reverse shell.<br>
   run away <3</p>

**Instruction Version 2:**
Without automatic setup:
Define INSTALL and set it to FALSE
![alt text](https://github.com/0i41E/usbrubberducky-payloads/blob/master/payloads/library/remote_access/PingZhellDucky/media/install.png)

Upload PingZhellDucky.pl onto your attacking machine.
Install dependencies, if needed:
- IO::Socket
- NetPacket::IP
- NetPacket::ICMP

Disable ICMP replies by the OS:
    `sysctl -w net.ipv4.icmp_echo_ignore_all=1`

Start the client -> `perl PingZhellDucky.pl`
![alt text](https://github.com/0i41E/usbrubberducky-payloads/blob/master/payloads/library/remote_access/PingZhellDucky/media/Client.png)

Define the IP of your attacking machine between the quotes at the ATTACKER section
![alt text](https://github.com/0i41E/usbrubberducky-payloads/blob/master/payloads/library/remote_access/PingZhellDucky/media/ip.png)

<p>Plug your Ducky into a Windows target.<br>
Achieve reverse shell.<br>
   run away <3</p>


Credit for DS 3.0 implentation and ideas:
- Korben
- bdamele
- Nikhil Mittal
- krabelize

