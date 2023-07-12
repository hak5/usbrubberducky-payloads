# Windows Product Duckey

The payload fetches the Windows product key from the target PC and sends it to your [Dropbox](https://www.dropbox.com).

> Note: This payload use the "[PowerShell_To_Dropbox](https://github.com/Who-Is-Julien/Ducky-Utilities/blob/main/Extensions/PowerShell_To_Dropbox/README.md)" extension.


## Payload operation

1. Open a PowerShell window using the Windows+x menu.
2. Run PowerShell code that performs the following actions:
- Stores your Windows product key in a variable called "$report".
- Sends the content of the "$report" variable to a file in your Dropbox.
- Clear PowerShell history, then close the window.

## Results

The product key can be found in the file named after the target computer within the "reports" folder of your Dropbox.

## Authors

- [@Who-Is-Julien](https://github.com/Who-Is-Julien)
