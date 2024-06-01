# Dump Windows Memory Through ProcDump

This payload allows you to dump the RAM memory used by a running application by using the free software ProcDump.

**Category**: Exfiltration

## Table of Contents

- [Dependencies](#dependencies)
- [Description](#description)
- [Yours TODO](#yours-todo)
- [Read More](#read-more)
- [Credits](#credits)

## Dependencies

* Authorization to execute powershell commands

## Description

This payload targets machines running Windows operating systems capable of executing commands via PowerShell.

Its first action is to use the Rubber Ducky DETECT_READY\[3] extension to avoid unnecessary waiting times before the operating system is ready.

Once the OS is active, the payload opens a PowerShell shell without administrator privileges and identifies the name assigned to the Rubber Ducky by combining Windows' Get-Volume and DriveLetter commands.

Subsequently, to avoid requests for administrative permissions during the memory dumping operation with ProcDump, the payload directly moves to the Rubber Ducky, where it executes ProcDump, allowing the output to be stored directly on the USB drive without the need for additional permissions.

To avoid potential complications related to exception handling during the execution of ProcDump, the payload uses the PID number instead of the process name.

To obtain all active process PIDs the tasklist command is used, which provides this information comprehensively.

## Yours TODO

1. Download ProcDump\[5].
2. Move the extracted ProcDump folder or directly the executable, as you prefer, inside Rubber Ducky's memory.
3. Then you have to change the variable `#WHAT_EXE_DO_YOU_WANT_TO_USE` if you want to use an executable other than `procdump64a.exe`, i.e. `procdump.exe` and, in this case, you have to change the variable to `procdump`.
4. When you put the executable(s) inside the Rubber Ducky memory you must indicate the path where is stored, i.e. if the executable is inside the path `F:\ProcDump\Procdump\procdump.exe` you must change the variable `#PATH_TO_EXE` into `\ProcDump\Procdump\` mean while if it is inside the path `F:\somethingelse\procdump.exe` you must change this variable into `\somethingelse\`.

## Read More

- \[1] [ProcDump Documentation](https://learn.microsoft.com/en-us/sysinternals/downloads/procdump)
- \[2] [How to collect memory dumps using ProcDump](https://support.sitecore.com/kb?id=kb_article_view&sysparm_article=KB0253710)
- \[3] [DETECT READY - SMARTER INITIAL DELAYS FOR KEYSTROKE INJECTION ATTACKS WITH THE USB RUBBER DUCKY](https://shop.hak5.org/blogs/usb-rubber-ducky/detect-ready)
- \[4] [Physical Medium Exfiltration](https://docs.hak5.org/hak5-usb-rubber-ducky/advanced-features/exfiltration)
- \[5] [Download ProcDump for Windows target](https://download.sysinternals.com/files/Procdump.zip)

## Credits

<h2 align="center"> Aleff :octocat: </h2>
<div align=center>
<table>
  <tr>
    <td align="center" width="96">
      <a href="https://github.com/aleff-github">
        <img src=https://github.com/aleff-github/aleff-github/blob/main/img/github.png?raw=true width="48" height="48" />
      </a>
      <br>Github
    </td>
    <td align="center" width="96">
      <a href="https://www.linkedin.com/in/alessandro-greco-aka-aleff/">
        <img src=https://github.com/aleff-github/aleff-github/blob/main/img/linkedin.png?raw=true width="48" height="48" />
      </a>
      <br>Linkedin
    </td>
  </tr>
</table>
</div>
