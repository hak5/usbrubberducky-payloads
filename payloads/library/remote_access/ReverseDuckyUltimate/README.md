# Title: ReverseDuckyUltimate

<p>Author: 0i41E<br>
OS: Windows<br>
Version: 1.0<br>
Requirements: DuckyScript 3.0, PayloadStudio v. 1.3.0 minimum</p>

**What is ReverseDuckyUlitmate?**
#
*ReverseDuckyUltimate (RDU) takes the best of every ReverseDucky payload. Customization, encryption, indentifiers, multi-layer polymorphism and automatic setup!*
*RDU is the ulitmate experience when it comes to remote access via your Rubber Ducky and it's so easy to use!*
#
## Instruction

Using ReverseDuckyUltimate is easy and straight forward, for instructions for automatic setup, click [here](https://github.com/0i41E/usbrubberducky-payloads/blob/master/payloads/library/remote_access/ReverseDuckyUltimate/README.md#instruction---automatic-setup).
- First: Create key.pem & cert.pem like so: <br>
```
openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -nodes
```
It will ask for information about the certificate - Insert whatever you want.<br>

![alt text](https://github.com/0i41E/usbrubberducky-payloads/blob/master/payloads/library/remote_access/ReverseDuckyUltimate/media/cert.png)

- Second: Start a listener on your attacking machine which supports certificates.
	Examples: 
```
openssl s_server -quiet -key key.pem -cert cert.pem -port [Port Number]
ncat --listen -p [Port Number] --ssl --ssl-cert cert.pem --ssl-key key.pem
```
- Third: Define the IP-Address and Port of your listening machine within the payload, as also if your target is a Windows 11 based system. _Disclaimer: Windows 11 mode will modify the registry. Bad opsec!_

Additionally add an unique identifier to give your Duck a name.

![alt text](https://github.com/0i41E/usbrubberducky-payloads/blob/master/payloads/library/remote_access/ReverseDuckyUltimate/media/config.png)

- Fourth: Compile the payload, using PayloadStudio in version 1.3.0 minimum, transfer it onto your Ducky and you are good to go.

## Instruction - Automatic Setup
- First: Navigate to `#SETUP` and set its value to `TRUE` and set your desired `#PORT` to the port you want to use.

![alt text](https://github.com/0i41E/usbrubberducky-payloads/blob/master/payloads/library/remote_access/ReverseDuckyUltimate/media/setup.png)

- Second: Compile the payload, using PayloadStudio in version 1.3.0 minimum, transfer it onto your Ducky. Open up an elevated terminal on your attacking machine and instert the Ducky.

![alt text](https://github.com/0i41E/usbrubberducky-payloads/blob/master/payloads/library/remote_access/ReverseDuckyUltimate/media/execsetup.png)

- Third: After the automatic setup, a listener should be running on your machine. Now re-enter PayloadStudio, set `#SETUP` to `FALSE`, define your IP-Address, compile the payload and you're good to go!

![alt text](https://github.com/0i41E/usbrubberducky-payloads/blob/master/payloads/library/remote_access/ReverseDuckyUltimate/media/autoip.png)
#

![alt text](https://github.com/0i41E/usbrubberducky-payloads/blob/master/payloads/library/remote_access/ReverseDuckyUltimate/media/pwn.png)

Credit for DS 3.0 implentation and ideas:
- Daniel Bohannon
- Grzegorz Tworek
- Korben
- Nikhil Mittal
