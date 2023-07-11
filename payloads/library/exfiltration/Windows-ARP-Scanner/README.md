# Windows ARP Scanner

The payload performs an [ARP](https://en.wikipedia.org/wiki/Address_Resolution_Protocol) scan on the target PC's network and sends the results of this scan to your [Dropbox](https://www.dropbox.com).

> Note : This payload use the "[PowerShell_To_Dropbox](https://github.com/Who-Is-Julien/Ducky-Utilities/blob/main/Extensions/PowerShell_To_Dropbox/README.md)" extension.


## Payload operation

1. Open a PowerShell window using the Windows+x menu.
2. Run PowerShell code that performs the following actions:
- Perform an ARP scan.
- Send results to your Dropbox.
- Clear PowerShell history, then close the window.


## Authors

- [@Who-Is-Julien](https://github.com/Who-Is-Julien)
