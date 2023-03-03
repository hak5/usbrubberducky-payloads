### Exported from README.md

<h1><a href='https://payloadhub.com'>Contributing</a></h1>

<p align="center">
<a href="https://payloadhub.com"><img src="https://cdn.shopify.com/s/files/1/0068/2142/files/payloadhub.png?v=1652474600"></a>
<br/>
<a href="https://payloadhub.com">View Featured Payloads and Leaderboard </a>
</p>

# Please adhere to the following best practices and style guides when submitting a payload.

Once you have developed your payload, you are encouraged to contribute to this repository by submitting a Pull Request. Reviewed and Approved pull requests will add your payload to this repository, where they may be publically available.

Please include all resources required for the payload to run. If needed, provide a README.md in the root of your payload's directory to explain things such as intended use, required configurations, or anything that will not easily fit in the comments of the payload.txt itself. Please make sure that your payload is tested, and free of errors. If your payload contains (or is based off of) the work of other's please make sure to cite their work giving proper credit. 


### Purely Destructive payloads will not be accepted. No, it's not "just a prank".
Subject to change. Please ensure any submissions meet the [latest version](https://github.com/hak5/usbrubberducky-payloads/blob/master/README.md) of these standards before submitting a Pull Request.



## Naming Conventions
Please give your payload a unique, descriptive and appropriate name. Do not use spaces in payload, directory or file names. Each payload should be submit into its own directory, with `-` or `_` used in place of spaces, to one of the categories such as exfiltration, phishing, remote_access or recon. Do not create your own category.

## Staged Payloads
"Staged payloads" are payloads that **download** code from some resource external to the payload.txt. 

While staging code used in payloads is often useful and appropriate, using this (or another) github repository as the means of deploying those stages is not. This repository is **not a CDN for deployment on target systems**. 

Staged code should be copied to and hosted on an appropriate server for doing so **by the end user** - Github and this repository are simply resources for sharing code among developers and users.
See: [GitHub acceptable use policies](https://docs.github.com/en/site-policy/acceptable-use-policies/github-acceptable-use-policies#5-site-access-and-safety)

Additionally, any source code that is intended to be staged **(by the end user on the appropriate infrastructure)** should be included in any payload submissions either in the comments of the payload itself or as a seperate file. **Links to staged code are unacceptable**; not only for the reasons listed above but also for version control and user safety reasons. Arbitrary code hidden behind some pre-defined external resource via URL in a payload could be replaced at any point in the future unbeknownst to the user -- potentially turning a harmless payload into something dangerous.

### Including URLs
URLs used for retrieving staged code should refer exclusively to **example.com** using DEFINE in any payload submissions [see Payload Configuration section below](https://github.com/hak5/usbrubberducky-payloads/blob/master/README.md#payload-configuration). 

### Staged Example

**Example scenario: your payload downloads a script and the executes it on a target machine.**
- Include the script in the directory with your payload
- Provide instructions for the user to move the script to the appropriate hosting service.
- Provide a DEFINE with the placeholder example.com for the user to easily configure once they have hosted the script

[Simple Example of this style of payload](https://github.com/hak5/usbrubberducky-payloads/tree/master/payloads/library/exfiltration/Printer-Recon)

## Payload Configuration
Be sure to take the following into careful consideration to ensure your payload is easily tested, used and maintained.
In many cases, payloads will require some level of configuration **by the end payload user**. 

- Abstract configuration(s) for ease of use. Use `DEFINE` where possible. Best practice is to use labels that start with # for easy identification throughout your payload.
- Remember to use PLACEHOLDERS for configurable portions of your payload - do not share your personal URLs, API keys, Passphrases, etc...
- URLs to staged payloads SHOULD NOT BE INCLUDED. URLs should be replaced by example.com. Provide instructions on how to specific resources should be hosted on the appropriate infrastructure.
- Make note of both REQUIRED and OPTIONAL configuration(s) in your payload using comments at the top of your payload or "inline" where applicable
<pre>
Example: 
	BEGINNING OF PAYLOAD 
	... Payload Documentation... 

	REM CONFIGURATION
	REM REQUIRED - Provide URL used for Example
	DEFINE #MY_TARGET_URL example.com

	REM OPTIONAL - How long until payload starts; default 5s
	DEFINE #BOOT_DELAY 5000

	DELAY #BOOT_DELAY
	...
	STRING #MY_TARGET_URL
	...
</pre>

## Payload Documentation 
Payloads should begin with `REM` comments specifying the title of the payload, the author, the target, and a brief description.
<pre>
Example:
	BEGINNING OF PAYLOAD

	REM Title: Example Payload
	REM Author: Korben Dallas
	REM Description: Opens hidden powershell and
	REM Target: Windows 10
	REM Props: Hak5, Darren Kitchen, Korben
	REM Version: 1.0
	REM Category: General
</pre>
