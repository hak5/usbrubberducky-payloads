 
# Exfiltrate Cloud Credentials (Azure/AWS)

Exfils Azure access token and AWS keys using respective CLI.

**Category**: Exfiltration

## Description

Opens PowerShell and retrieves Azure and AWS access tokens/keys and exfils them to an HTTP endpoint. Gathers keys from .aws/credentials file first, then if it doesn't exist it will pull from environment variables. Uses Azure CLI to get access token as they are now encrypted on disk.

## Getting Started

### Dependencies

* Internet connection
* Windows system
* Azure CLI and/or AWS CLI
  * Need to be authenticated to Azure and have credentials stored for AWS
* HTTP endpoint that can accept post requests such as [Pipedream](https://pipedream.com/)

### Executing program

* Encode the ducky script
* Copy inject.bin onto your SD card
* Insert into target machine
* Monitor incoming post requests to your endpoint. Data is base64 encoded for obfuscation so it will need to be decoded.

### Settings

* Set the endpoint URL
* Remove Azure/AWS sections if you have no need for either

