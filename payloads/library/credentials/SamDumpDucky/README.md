**Title: SamDumpDucky**

<p>Author: 0i41E<br>
OS: Windows<br>
Version: 2.0<br>

**What is SamDumpDucky?**
#
<p>SamDumpDucky dumps the users sam and system hive and exfiltrate them onto the Ducky.<br>
Afterwards you can use a tool like pypykatz to extract the users hashes.</p>


**Instruction:**
1. Change the language within the extension "Windows_Elevated_Execution" to your model, default was set to german.

2. Compile the payload using PayloadStudio and place it onto your Ducky.

3. Plug in your RubberDucky and wait for the process to end, this may take a while due to the Duckys slow transfer speed.

4. Use a tool like samdump2 or pypykatz on your machine to extract the users hashes.
	> `samdump2 DuckySys DuckySam`
	or  `pypykatz registry DuckySys --sam DuckySam`
	
	**!Disclaimer! samdump2 has proven to be unreliable in the recent past.**

![alt text](https://github.com/0i41E/omg-payloads/blob/master/payloads/library/credentials/SamDumpCable/sam.png)
