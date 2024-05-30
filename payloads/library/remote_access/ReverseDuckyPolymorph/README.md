**Title: ReverseDuckyPolymorph**

<p>Author: 0i41E, Korben<br>
OS: Windows<br>
Version: 1.1<br>
Requirements: DuckyScript 3.0, PayloadStudio v. 1.3.0 minimum</p>

**What is ReverseDuckyPolymorph?**
#
*One of the biggest problems when publishing payloads, exploits, POCs, etc. is static detection. If X hundred or thousand people use your script it's more than burned.*
*So I created ReverseDuckyPolymorph to fight static detection. Everytime this payload will be used by your Ducky, the variables change and therefore are harder to pin point.*
*This of course is no guarantee for bypassing every AV, but it may help to bypass certain protections for a longer time.*
#
**Instruction**

Using ReverseDuckyPolymorph is easy and straight forward.
- First, start a listener on your attacking machine via the tool of your choice.
- Second, define the IP-Address and Port of your listening machine

![alt text](https://github.com/0i41E/usbrubberducky-payloads/blob/master/payloads/library/remote_access/ReverseDuckyPolymorph/media/listener.png)
- Third, compile the payload, using payloadstudio in version 1.3.0 minimum, transfer it onto your Ducky and you are good to go.
#
Every session you will gain via this payload will result in a different ID to verify a different pattern.
![alt text](https://github.com/0i41E/usbrubberducky-payloads/blob/master/payloads/library/remote_access/ReverseDuckyPolymorph/media/ID.png)

Credit for DS 3.0 implentation and ideas:
- Korben
- Nikhil Mittal
