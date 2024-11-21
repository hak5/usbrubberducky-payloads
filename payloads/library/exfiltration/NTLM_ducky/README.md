# Exfiltrate NTLM Hash - Windows ✅

A Rubber Ducky payload to exfiltrate NTLM hash files from a Windows machine onto the SD card.

## Description

This payload script captures and <strong>exfiltrates NTLM hash files</strong> from a Windows machine. It uses PowerShell commands to locate and save the SAM and SYSTEM files, which contain hashed user passwords, <strong><u>onto the Rubber Ducky's SD card</u></strong> for later extraction and analysis. Upon successful file extraction, <strong> the payload triggers a visual confirmation by <u>blinking the Caps Lock LED</u> </strong>


### Settings

- **Drive Label:** Set the target drive label for Rubber Ducky storage (default: `DUCKY`).
- **Blink Count:** Adjust the number of Caps Lock LED blinks by setting the `#numBlinks` variable (default is 9 blinks).

## Credits

<h2 align="center"> Luu176 </h2>
<div align="center">
  <table>
    <tr>
      <td align="center" width="96">
        <a href="https://github.com/luu176">
          <img src="https://avatars.githubusercontent.com/u/112649910?v=4" width="48" height="48" />
        </a>
        <br>GitHub
      </td>
    </tr>
  </table>
</div>
