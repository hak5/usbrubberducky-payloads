# Set Tor Bridge in Windows

Introducing the "Set Tor Bridge in Windows" payload a DuckyScript payload designed for USB Rubber Ducky. This versatile payload empowers users to manually configure Tor bridges, enabling the selection of any bridge of their choice. With the ease of customization, users can redefine their Tor experience by setting bridges in a way that suits their preferences. This payload not only provides flexibility but also enhances user control over their Tor network settings.

> In Tor, a "bridge" is a server used as an intermediary to help users connect to the Tor network more securely and bypass any restrictions or censorship on accessing Tor. Bridges are often employed when direct access to Tor is blocked or monitored by a firewall or censorship system.
>
> Essentially, when using a bridge, the initial connection is made through the bridge instead of through a standard Tor entry node. This makes it more challenging for censors to identify and block Tor traffic, as the traffic through the bridge appears like regular, non-Tor traffic.
>
> Bridges can be manually configured in the Tor client settings, allowing users to overcome restrictions and access the Tor network in situations where it might otherwise be prevented.

*Source: What is a bridge\[[2](#sources)]*

**Category**: Execution

## Index

- [Set Tor Bridge in Windows](#set-tor-bridge-in-windows)
- [Payload Description](#payload-description)
- [Note](#note)
- [Sources](#sources)
- [Credits](#credits)

## Payload Description

The following DuckyScript payload is designed to execute a series of commands using the TorBrowser. It requires Tor to be installed before running. Here's a description of the payload's behavior:

1. Opens the Start menu by pressing the GUI (Windows) key.
2. Types "TorBrowser" and presses Enter to launch the TorBrowser.
3. Executes a sequence of key presses to navigate in the browser:
    
   a. Presses ALT
   
   b. Then 2 times the Left Arrow to position yourself on the "Tools" item

   c. Presses ENTER to open the menu

   d. Up Arrow and ENTER to open the settings page

   e. Write the contstant "Add a new Bridge" to search the bridge section
   
   f. Now the ALT TAB command combination is repeated 12 times. It is seemingly counterintuitive to go backwards, but this strategy allows the use of this payload to be generalized in that it does not change whether other active bridges are already present.
   
   h. Presses Enter to open the Manual Bridge area.
5. Moves the cursor to the text area (TAB).
6. Writes the contents of the variables #BRIDGE, #BRIDGE-N, multiple bridges can be entered.
7. Saves the new settings and closes
8. Closes the TorBrowser using the ALT F4 key combination.

## Note

- The payload is designed to run on a Windows system and requires Tor to be installed.
- The variable #BRIDGE is defined at the beginning of the payload to allow the user to specify their own bridge.
- Ensure that the key sequences are adapted to the specific version of the TorBrowser in use.
- The payload incorporates the DETECT_READY\[[1](#sources)] extension to optimize the system's wait before starting the TorBrowser and executing subsequent operations. This approach aims to ensure that each step of the payload is executed only when the system is fully ready, contributing significantly to overall execution efficiency.

## Sources

1. Detect Ready - Smarter Initial Delays for Keystroke Injection Attacks with the USB Rubber Ducky - https://shop.hak5.org/blogs/usb-rubber-ducky/detect-ready
2. What is a bridge? - https://support.torproject.org/censorship/censorship-7/

## Credits

<h2 align="center"> Aleff</h2>
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