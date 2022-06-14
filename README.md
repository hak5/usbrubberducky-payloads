# Payload Library for the USB Rubber Ducky by Hak5

This repository contains payloads and extensions for the Hak5 USB Rubber Ducky. Community developed payloads are listed and developers are encouraged to create pull requests to make changes to or submit new payloads.

## About the USB Rubber Ducky

A "flash drive" that types keystroke injection payloads into unsuspecting computers at incredible speeds.

-   [Purchase at Hak5](https://hak5.org/products/usb-rubber-ducky-deluxe "Purchase at Hak5")
-   [Documentation](https://help.hak5.org/usb-rubber-ducky-1/ "Documentation")
-   [Encoder](https://downloads.hak5.org/ducky "Encoder")
-   [Forums](https://forums.hak5.org/forum/56-usb-rubber-ducky/ "Forums")
-   [Discord](https://hak5.org/discord "Discord")

![USB Rubber Ducky](https://cdn.shopify.com/s/files/1/0068/2142/products/rubber_ducky_300x.jpg)

## Disclaimer
Generally, payloads may execute commands on your device. As such, it is possible for a payload to damage your device. Payloads from this repository are provided AS-IS without warranty. While Hak5 makes a best effort to review payloads, there are no guarantees as to their effectiveness. As with any script, you are advised to proceed with caution.

## Legal
Payloads from this repository are provided for educational purposes only.  Hak5 gear is intended for authorized auditing and security analysis purposes only where permitted subject to local and international laws where applicable. Users are solely responsible for compliance with all laws of their locality. Hak5 LLC and affiliates claim no responsibility for unauthorized or unlawful use.

## Contributing
Once you have developed your payload, you are encouraged to contribute to this repository by submitting a Pull Request. Reviewed and Approved pull requests will add your payload to this repository, where they may be publically available.

Please adhere to the following best practices and style guide when submitting a payload.

### Naming Conventions
Please give your payload a unique and descriptive name. Do not use spaces in payload names. Each payload should be submit into its own directory, with `-` or `_` used in place of spaces, to one of the categories such as exfiltration, phishing, remote_access or recon. Do not create your own category.

### Comments
Payloads should begin with `REM` comments specifying the title of the payload, the author, the target, and a brief description.

    REM Title: Canary Duck
	REM Author: Jessie Crimson Hart
	REM Description: Opens hidden powershell and connects to canary webserver using Invoke-WebRequest alerting you to spies and snoops.
	REM Target: Windows 10 (Powershell)
	REM Props: Hak5, Thinkst
	REM Version: 1.0
	REM Category: General

