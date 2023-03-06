# ProtonVPN config file ✅

A script used to stole target ProtonVPN config file.

**Category**: Credentials, Exfiltration

## Description

This script will stole target ProtonVPN config file.

Opens PowerShell hidden, grabs ProtonVPN config file, saves as a cleartext in a variable and exfiltrates info via Discord Webhook.
In the config file you can find a lot information about the user like:
- UserUid 
- UserAccessToken
- UserRefreshToken
- UserAuthenticationPublicKey
- UserAuthenticationSecretKey
- UserAuthenticationCertificatePem
- UserCertificationServerPublicKey 
- and so on...

Then it cleans up traces of what you have done after.

## Getting Started

### Dependencies

* ProtonVPN user logged at least one time
* An internet connection
* Windows 10,11

### Executing program

* Plug in your device
* Invoke Get-Content for get in plaintext the ProtonVPN .config content
* Invoke-WebRequest will be entered in the Run Box to send the content

