# Payload Library for the [USB Rubber Ducky](https://hak5.org/products/usb-rubber-ducky?variant=39874478932081) by [Hak5](https://hak5.org)

This repository contains payloads, extensions and languages for the Hak5 USB Rubber Ducky. Community developed payloads are listed and developers are encouraged to create pull requests to make changes to or submit new payloads.

**Payloads here are written in official DuckyScript™ specifically for the USB Rubber Ducky. Payloads here must be compiled using Hak5 PayloadStudio. Hak5 does NOT guarantee payload functionality.** <a href="#legal"><b>See Legal and Disclaimers</b></a>



<div align="center">
<img src="https://img.shields.io/github/forks/hak5/usbrubberducky-payloads?style=for-the-badge"/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="https://img.shields.io/github/stars/hak5/usbrubberducky-payloads?style=for-the-badge"/>
<br/>
<img src="https://img.shields.io/github/commit-activity/y/hak5/usbrubberducky-payloads?style=for-the-badge">
<img src="https://img.shields.io/github/contributors/hak5/usbrubberducky-payloads?style=for-the-badge">
</div>
<br/>
<p align="center">
<a href="https://payloadhub.com"><img src="https://cdn.shopify.com/s/files/1/0068/2142/files/payloadhub.png?v=1652474600"></a>
<br/>
<a href="https://hak5.org/blogs/payloads/tagged/usb-rubber-ducky">View Featured Ducky Payloads and Leaderboard</a>
<br/><i>Get your payload in front of thousands. Enter to win over $2,000 in prizes in the <a href="https://hak5.org/pages/payload-awards">Hak5 Payload Awards!</a></i>
</p>


<div align="center">
<a href="https://hak5.org/discord"><img src="https://img.shields.io/discord/506629366659153951?label=Hak5%20Discord&style=for-the-badge"></a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="https://youtube.com/hak5"><img src="https://img.shields.io/youtube/channel/views/UC3s0BtrBJpwNDaflRSoiieQ?label=YouTube%20Views&style=for-the-badge"/></a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="https://youtube.com/hak5"><img src="https://img.shields.io/youtube/channel/subscribers/UC3s0BtrBJpwNDaflRSoiieQ?style=for-the-badge"/></a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="https://twitter.com/hak5"><img src="https://img.shields.io/badge/follow-%40hak5-1DA1F2?logo=twitter&style=for-the-badge"/></a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="https://instagram.com/hak5gear"><img src="https://img.shields.io/badge/Instagram-E4405F?style=for-the-badge&logo=instagram&logoColor=white"/></a>
<br/><br/>

</div>

# Table of contents
<details open>
<ul>
<li><a href="#about-the-new-usb-rubber-ducky">About the USB Rubber Ducky</a></li>
<li><a href="#build-your-payloads-with-payloadstudio">PayloadStudio (Editor + Compiler)</a></li>
<li><a href="#about-duckyscript">About DuckyScript™</a></li>
<li><b><a href="#contributing">Contributing Payloads</a></b></li>
<li><a href="#legal"><b>Legal and Disclaimers</b></a></li>
</ul> 
</details>


## Shop
- [NEW USB Rubber Ducky](https://hak5.org/products/usb-rubber-ducky?variant=39874478932081 "Purchase the NEW USB Rubber Ducky")
- [PayloadStudio Pro](https://hak5.org/products/payload-studio-pro "Purchase PayloadStudio Pro")
- [Shop All Hak5 Tools](https://shop.hak5.org "Shop All Hak5 Tools")
## Getting Started
- [Build and Encode Payloads with PayloadStudio](#build-your-payloads-with-payloadstudio) | [QUICK START GUIDE](https://docs.hak5.org/hak5-usb-rubber-ducky/unboxing-quack-start-guide "QUICK START GUIDE") | [Your First Payload](https://docs.hak5.org/hak5-usb-rubber-ducky/ducky-script-basics/hello-world)
## Documentation / Learn More
-   [Documentation](https://docs.hak5.org/hak5-usb-rubber-ducky/ "Documentation") | [Quick Reference Guide](https://docs.hak5.org/hak5-usb-rubber-ducky/ducky-script-quick-reference "Quick Reference Guide")
-   [Advanced DuckyScript Online Course](https://shop.hak5.org/collections/usb-rubber-ducky-essentials/products/advanced-duckyscript-course "DuckyScript Online Course") | [Textbook](https://shop.hak5.org/collections/usb-rubber-ducky-essentials/products/usb-rubber-ducky-textbook "Textbook")
## Community
*Got Questions? Need some help? Reach out:*
-  [Discord](https://hak5.org/discord/ "Discord") | [Forums](https://forums.hak5.org/forum/111-new-usb-rubber-ducky/ "Forums")


## Additional Links
<b> Follow the creators </b><br/>
<p>
	<b>Korben's Socials</b><br/>	
	<a href="https://twitter.com/notkorben"><img src="https://img.shields.io/twitter/follow/notkorben?style=social"/></a>  
	<a href="https://instagram.com/hak5korben"><img src="https://img.shields.io/badge/Instagram-Follow%20@hak5korben-E1306C"/></a>
<br/>
	<b>Darren's Socials</b><br/>
	<a href="https://twitter.com/hak5darren"><img src="https://img.shields.io/twitter/follow/hak5darren?style=social"/></a>  
	<a href="https://instagram.com/hak5darren"><img src="https://img.shields.io/badge/Instagram-Follow%20@hak5darren-E1306C"/></a>
</p>

<br/>
<h1><a href="https://hak5.org/products/usb-rubber-ducky">About the NEW USB Rubber Ducky</a></h1>

A "flash drive" that types keystroke injection payloads into unsuspecting devices at incredible speeds.


<b><div align="center">
	<br/>
<a href="https://www.youtube.com/watch?v=meNlOrdQJFo">Launch Video</a> | 
<a href="https://shop.hak5.org/pages/keystroke-reflection">Introducing Keystroke Reflection</a> |
<a href="https://www.youtube.com/watch?v=hFfo1TdY9hU">Introducing OS Detection</a>
<br/><br/>
</div></b>

<p align="center">
<a href="https://www.youtube.com/watch?v=meNlOrdQJFo"><img src="https://3076592524-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-MiIkRK_o3RBhZzUkrzr%2Fuploads%2FCiHTAeL8jlCA3mG7ltCF%2FScreencast%20from%2003-03-2023%2001_08_58%20PM.gif?alt=media"/></a>
<br/>
<i>New USB Rubber Ducky (A+C, DuckyScript 3.0, 2022)</i>
</p>

Computers trust humans. Humans use keyboards. Hence the universal spec — HID, or Human Interface Device.

A keyboard presents itself as a HID, and in turn it's inherently trusted as human by the computer.

The USB Rubber Ducky — which looks like an innocent flash drive to humans — takes advantage of this trust to deliver powerful payloads, injecting keystrokes at superhuman speeds. 

Easily automate any task you can perform with a keyboard with an easy to learn language designed specifically for the USB Rubber Ducky.



# About DuckyScript™

## Legacy DuckyScript (1.0)
Hak5 introduced Keystroke Injection in 2010 with the USB Rubber Ducky™. This technique, developed by Hak5 founder Darren Kitchen, was his weapon of choice for automating mundane tasks at his IT job — fixing printers, network shares and the like.
Today the USB Rubber Ducky is a hacker culture icon, synonymous with the keystroke injection technique it pioneered. It’s found its way into the hearts and toolkits of Cybersecurity and IT pros the world over — including many movies and TV shows!
Core to its success is its simple language, DuckyScript™. Originally just three commands, it could be learned by anyone—regardless of experience—in minutes.

<b> With the new USB Rubber Ducky in 2022, DuckyScript 3.0 has been introduced.</b>
## DuckyScript 3.0
DuckyScript 3.0 is a feature rich, structured programming language. It includes all of the previously available commands and features of the original DuckyScript.

<b>(DuckyScript 3.0 is backwards compatible with DuckyScript 1.0; this means all your favorite DuckyScript 1.0 paylaods are valid DuckyScript 3.0) </b>

Additionally, DuckyScript 3.0 introduces [control flow constructs](https://docs.hak5.org/hak5-usb-rubber-ducky/operators-conditions-loops-and-functions/conditional-statements "View Documentation"), [loops](https://docs.hak5.org/hak5-usb-rubber-ducky/operators-conditions-loops-and-functions/loops "View Documentation"), [functions](https://docs.hak5.org/hak5-usb-rubber-ducky/operators-conditions-loops-and-functions/functions "View Documentation"), [extensions](https://docs.hak5.org/hak5-usb-rubber-ducky/advanced-features/extensions "View Documentation").
Plus, DuckyScript 3.0 includes many features specific to [keystroke injection](https://docs.hak5.org/hak5-usb-rubber-ducky/ducky-script-basics/keystroke-injection "View Documentation") attack/automation, such as [HID & Storage attack modes](https://docs.hak5.org/hak5-usb-rubber-ducky/attack-modes-constants-and-variables/attack-modes "View Documentation"), OS Detection, [Keystroke Reflection](https://docs.hak5.org/hak5-usb-rubber-ducky/advanced-features/exfiltration#the-keystroke-reflection-attack "View Documentation") ([Video + Whitepaper](https://shop.hak5.org/pages/keystroke-reflection "Keystroke Reflection Video + Whitepaper")), [jitter](https://docs.hak5.org/hak5-usb-rubber-ducky/advanced-features/jitter "View Documentation") and [randomization](https://docs.hak5.org/hak5-usb-rubber-ducky/advanced-features/randomization "View Documentation") to name a few.

While many of the Hak5 Tools run various versions of DuckyScript; unlike the [Bash Bunny](https://shop.hak5.org/products/bash-bunny), [Key Croc](https://shop.hak5.org/products/key-croc) and even the [officially licenced DuckyScript compatible devices from O.MG](https://shop.hak5.org/collections/mischief-gadgets/ "O.MG") - which use `INTERPRETED` versions of DuckyScript - the USB Rubber Ducky uses `COMPILED inject.bin` payloads. 


_Interpreted DuckyScript means the payload runs straight from `source code` (the code you write e.g. `DELAY 1000`)._

_Compiled DuckyScript means that there is both `source code` and an `inject.bin` generated from the source code. (DuckyScript 1.0 was "encoded" rather than "compiled" - references to either mean the same)_

The files in this repository are _the source code_ in the form of `payload.txt` files. 

<h1><a href="https://shop.hak5.org/collections/usb-rubber-ducky-accessories/products/advanced-duckyscript-course">Learn DuckyScript directly from the creators</a></h1>
<p align="center">
<a href="https://shop.hak5.org/collections/usb-rubber-ducky-accessories/products/advanced-duckyscript-course"><img width="500px" src="https://cdn.shopify.com/s/files/1/0068/2142/products/online-course-icon_2000x.png"/></a>

<p>
Learn Advanced DuckyScript directly from the creators and unlock creative potential for the USB Rubber Ducky. Covering all aspects of advanced DuckyScript and Keystroke Injection attacks, these practical lessons build on one another from the basics on up.

This online course includes 7 hours of video instruction covering 54 lessons, 40+ exercises to reinforce your knowledge, quizzes throughout as well as 8 projects to test your skills.
</p>
</p>



<h1><a href="https://payloadstudio.hak5.org">Build your payloads with PayloadStudio</a></h1>
<p align="center">
Take your DuckyScript™ payloads to the next level with this full-featured,<b> web-based (entirely client side) </b> development environment.
<br/>
<a href="https://payloadstudio.hak5.org"><img width="500px" src="https://cdn.shopify.com/s/files/1/0068/2142/products/payload-studio-icon_2000x.png"></a>
<br/>
<i>Payload studio features all of the conveniences of a modern IDE, right from your browser. From syntax highlighting and auto-completion to live error-checking and repo synchronization - building payloads for Hak5 hotplug tools has never been easier!
<br/><br/>
Supports your favorite Hak5 gear - USB Rubber Ducky, Bash Bunny, Key Croc, Shark Jack, Packet Squirrel & LAN Turtle!
<br/><br/></i><br/>
<a href="https://hak5.org/products/payload-studio-pro">Become a PayloadStudio Pro</a> and <b> Unleash your hacking creativity! </b>
<br/>
OR
<br/>
<a href="https://payloadstudio.hak5.org/community/"> Try Community Edition FREE</a> 
<br/><br/>
<img src="https://cdn.shopify.com/s/files/1/0068/2142/files/themes1_1_600x.gif?v=1659642557">
<br/>
<i> Payload Studio Themes Preview GIF </i>
<br/><br/>
<img src="https://cdn.shopify.com/s/files/1/0068/2142/files/AUTOCOMPLETE3_600x.gif?v=1659640513">
<br/>
<i> Payload Studio Autocomplete Preview GIF </i>
</p>




## DuckyScript Ecosystem

<h3><a href='https://github.com/hak5/usbrubberducky-payloads/blob/master/languages'>Languages </a></h3>
Support for different keyboard layouts can be found, modified or contributed to in the <b><a href='https://github.com/hak5/usbrubberducky-payloads/blob/master/languages'> languages/ </a></b> directory of this repository.

Compiling payloads for the correct language / keyboard layout has never been easier:

<a href='https://payloadstudio.hak5.org'> Open PayloadStudio \> Settings \> Compiler Settings</a> 

PayloadStudio includes all the languages provided in this repo built-in for your convenience. 

<a href="https://hak5.org/products/payload-studio-pro">PayloadStudio Pro</a> has a <b>dedicated language editor</b> specifically for editing and building language files! 

The default language is US <a href='https://github.com/hak5/usbrubberducky-payloads/blob/master/languages/us.json'>(languages/us.json)</a>

<h3><a href="https://docs.hak5.org/hak5-usb-rubber-ducky/advanced-features/extensions">Extensions</a></h3>
It should be clear by now that so much is possible with DuckyScript 3.0. The combination of  keystroke injection with various attack modes, logic and data processing, along with the built-in features like randomization and internal variables — the possibilities for advanced payload functions seems endless.
<p align="center">
<br/>
<img src="https://cdn.shopify.com/s/files/1/0068/2142/files/payload-studio-extensions_600x.gif?v=1659716795">
<br/>
<i> Payload Studio Extensions Preview GIF</i>
</p>

As the payload library continues to grow, so too will the DuckyScript 3.0 language. To that end, the extensions feature of the language and editor facilitate the continued growth of the language.
<b>Extensions are blocks of reusable code which may be implemented in any payload. Think of them as snippets, or building blocks, upon which your next payload may benefit.</b>
While Hak5 developers cannot envision all possible use cases for the USB Rubber Ducky, the DuckyScript language has been architected in such a way so that the community as a whole may gain new features and abilities with each contributed extension.

Extensions (beyond some first party examples) are currently reserved for collections of helper functions (+ required variables, defines, and configuration options) required to make a complex task simple - abstracting very complex problems down into one or a few calls for the ease of use to others (example: the translate extension).

To add an extension to your payload, simply start typing the name of the desired extension in your payload from within PayloadStudio then select it from the auto-complete drop down. Alternatively the full library can be found from within the Extensions folder of this repo.

[Read more here](https://docs.hak5.org/hak5-usb-rubber-ducky/advanced-features/extensions "Read more here")


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

<h1><a href="https://hak5.org/pages/policy">Legal</a></h1>

Payloads from this repository are provided for educational purposes only.  Hak5 gear is intended for authorized auditing and security analysis purposes only where permitted subject to local and international laws where applicable. Users are solely responsible for compliance with all laws of their locality. Hak5 LLC and affiliates claim no responsibility for unauthorized or unlawful use.

USB Rubber Ducky and DuckyScript are the trademarks of Hak5 LLC. Copyright © 2010 Hak5 LLC. All rights reserved. No part of this work may be reproduced or transmitted in any form or by any means without prior written permission from the copyright owner.
USB Rubber Ducky and DuckyScript are subject to the Hak5 license agreement (https://hak5.org/license)
DuckyScript is the intellectual property of Hak5 LLC for the sole benefit of Hak5 LLC and its licensees. To inquire about obtaining a license to use this material in your own project, contact us. Please report counterfeits and brand abuse to legal@hak5.org.
This material is for education, authorized auditing and analysis purposes where permitted subject to local and international laws. Users are solely responsible for compliance. Hak5 LLC claims no responsibility for unauthorized or unlawful use.
Hak5 LLC products and technology are only available to BIS recognized license exception ENC favorable treatment countries pursuant to US 15 CFR Supplement No 3 to Part 740.

See also: 

[Hak5 Software License Agreement](https://shop.hak5.org/pages/software-license-agreement)
	
[Terms of Service](https://shop.hak5.org/pages/terms-of-service)

# Disclaimer
<h3><b>As with any script, you are advised to proceed with caution.</h3></b>
<h3><b>Generally, payloads may execute commands on your device. As such, it is possible for a payload to damage your device. Payloads from this repository are provided AS-IS without warranty. While Hak5 makes a best effort to review payloads, there are no guarantees as to their effectiveness.</h3></b>
