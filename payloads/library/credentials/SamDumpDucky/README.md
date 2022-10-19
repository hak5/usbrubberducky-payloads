**Title: SamDumpDucky**

<p>Author: 0iphor13<br>
OS: Windows<br>
Version: 1.0<br>

**What is SamDumpDucky?**
#
<p>SamDumpDucky dumps the users sam and system hive and compresses them into a zip file and exfiltrate it onto the Ducky.<br>
Afterwards you can use a tool like pypykatz to extract the users hashes.</p>


**Instruction:**
1. Plug in your RubberDucky and wait a few seconds

2. Unzip the exfiltrated zip file onto your machine.

3. Use a tool like samdump2 or pypykatz on your machine to extract the users hashes.
	> `samdump2 DuckySys DuckySam`
	or  `pypykatz registry DuckySys --sam DuckySam`
	
	**!Disclaimer! samdump2 has proven to be unreliable in the recent past.**

![alt text](https://github.com/0iphor13/omg-payloads/blob/master/payloads/library/credentials/SamDumpCable/sam.png)
