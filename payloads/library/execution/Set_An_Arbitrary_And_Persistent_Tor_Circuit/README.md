# Set An Arbitrary And Persistent Tor Circuit

The "Set An Arbitrary And Persistent Tor Circuit" script is a payload designed to empower users to customize their Tor circuit according to their preferences using Duckyscript language. This payload provides the flexibility to set arbitrary Tor nodes and manually create a persistent circuit.

This script is highly versatile, as it is compatible with both Linux and Windows operating systems, thanks to the integration of the PASSIVE_WINDOWS_DETECT\[[1](#sources)] extension, enabling automatic system detection. Although testing on MacOS was not possible, it is likely that the payload can also be used on this operating system. This extension includes its own passive detect ready optimizing execution times making the entire process more efficient.

It is essential to emphasize that the use of this script must comply with local laws and respect the privacy of others. The primary goal of "Set An Arbitrary And Persistent Tor Circuit" is to provide users with more direct control over their Tor connection, allowing them to customize and further enhance their online browsing experience.

**Category**: Execution

![1](assets/1.gif)

*Dynamic visualization of the script in action. In this case I modified only the MiddleNode so that the persistence of the modification is shown but the full use of the payload results in immodifiability and persistence of all 3 nodes.*

_**Note**: The nodes are unmodifiable unless the initial Tor settings are restored or unless the torrc file is subsequently modified by removing the configurations made._

## Index

- [Set An Arbitrary And Persistent Tor Circuit](#set-an-arbitrary-and-static-tor-circuit)
- [Payload Description](#payload-description)
- [Note](#note)
- [Tor Configuration](#tor-configuration)
- - [Description of the Tor Circuit](#description-of-the-tor-circuit)
- - [Torrc Configuration File](#torrc-configuration-file)
- [Tor University Challenge by EFF](#tor-university-challenge-by-eff) *Off-topic* 
- [Sources](#sources)
- [Credits](#credits)

## Payload Description

**Requirements:**
- Tor installed
- Fingerprints of your relays

**Notes:**
- Payload tested using TorBrowser 13.0.8 based on Mozilla Firefox 115.6.0esr ENG
- Payload tested on Windows 11_eng; Debian 12_eng; Ubuntu 23.10_eng;

To find fingerprints of various nodes you can go to https://metrics.torproject.org and set up a search based on what you are interested in such as country, node name, etc... For example if you try to search for '**Aleff**' it will send you to my [Tor Relay page](https://metrics.torproject.org/rs.html#details/B8C9DF8404FE175E37241774856907184A667ED2) (_Unless someone has created other Relays with the same name in the meantime_) where you can find the fingerprint information which is the data you are interested in.

![](https://i.ibb.co/YN5515G/tor-node.png)

The script begins by defining the fingerprints of the entry, middle, and exit nodes using the `DEFINE` commands. Additionally, it provides instructions for activating administrator permissions, with specific considerations for systems like Debian and Ubuntu.

**Configuration on Linux:**
- If the operating system is Linux, the user must provide the command to obtain root privileges (`#root_permission_command`) as `sudo su` instead of `su` and the associated password (`#sudo_pass`).

**Configuration on Windows:**
- If the operating system is Windows, the script opens TorBrowser using Windows GUI commands.
- Is not needed the root privileges
- It overwrites all the old data with the new data defined at the beginning of the script.

The script aims to edit the Tor configuration process to ensure the specific use of entry, middle, and exit nodes. Users need to customize the node fingerprints and provide specific operating system information to ensure the correct operation of the script on the target platform.

In any case, the script is designed to completely overwrite the old configuration of the torrc file, so be very careful how you use it since it could be an irreversible change and could cause a loss of data.

## Note

- The payload is designed to run on a Windows or Linux system and requires Tor to be installed.
- **#EntryNode**, **#MiddleNode**, **#ExitNode**: These variables must contain the fingerprint of the relays you want to use as nodes in your circuit.
- **#root_permission_command**: Activation of administrator permissions may vary from system to system. For example, for Debian it is necessary to use 'su' while for other systems such as Ubuntu it is necessary to use 'sudo su'. In general this can vary and is information that could be crucial in case the target has tampered with this functionality.
- **#sudo_pass**: Edit this field only if you plan to use this script on Linux operating systems as you need administrator permissions and therefore you need to know the password.
- **#const_var**: Do not change the variables that begin with 'const', they are constants that allow the nodes to be configured correctly.
- **EXTENSION**: Through the use of the PASSIVE_WINDOWS_DETECT\[[1](#sources)] extension, it is possible to detect the operating system on which the payload is launched, which, in this case, can be differentiated between Windows or any other operating system, which in our case corresponds to Linux. This powerful extension also allows you to determine when the system is ready to use since it includes the extension the passive Detect Ready. Using this extension not only makes it possible to use this payload dynamically on multiple systems, but also makes it extremely more efficient.

## Tor Configuration

![Tor](https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Tor-logo-2011-flat.svg/459px-Tor-logo-2011-flat.svg.png)

### Description of the Tor Circuit

The Tor circuit is a fundamental component of the infrastructure that ensures anonymity and security in online communications. The Tor circuit consists of three types of nodes, each with a specific role: Entry Node, Middle Node, and Exit Node.

![Tor Circuit](https://upload.wikimedia.org/wikipedia/commons/d/dc/Tor-onion-network.png)

1. **Entry Node:**
   - The Entry Node is the first node in the Tor circuit.
   - When a user initiates a connection through Tor, the traffic is encrypted and sent to the Entry Node.
   - The Entry Node is aware of the user's IP address but cannot see the final destination of the traffic.
   - Its primary function is to pass it to the next node, so the Middle Node, without knowing the ultimate destination.

2. **Middle Node:**
   - The Middle Node is the second node in the Tor circuit.
   - It receives encrypted traffic from the Entry Node and forwards it to the next node in the chain, which can be another Middle Node or the Exit Node.
   - The Middle Node is not aware of the user's IP address or the final destination of the traffic.
   - Its main function is to further enhance anonymity since it lacks information about the origin or destination of the traffic.

3. **Exit Node:**
   - The Exit Node is the last node in the Tor circuit.
   - It receives encrypted traffic from the Middle Node and decrypts it before sending it to the final destination on the internet.
   - The Exit Node is aware of the destination address but does not know the user's IP address and the Entry Node in the same circuit.
   - Its primary function is to provide a point of exit for the traffic while maintaining the anonymity of the user.

### Torrc Configuration File

The `torrc` configuration file is a crucial component of the Tor, governing the behavior and settings of the Tor network on a particular system. This plaintext configuration file is typically named "torrc" and is utilized to customize various aspects of Tor's operation. Here's an overview of the key elements found in the `torrc` file:

1. **Entry, Middle, and Exit Nodes Configuration:**
   - Users can specify the fingerprints or identities of preferred Entry, Middle, and Exit nodes using directives like `EntryNodes`, `MiddleNodes`, and `ExitNodes`. This allows users to influence the selection of these nodes in their Tor circuit for enhanced control or security. *This functionality is used in this payload.*

2. **General Tor Configuration:**
   - The `torrc` file includes parameters for configuring the general behavior of Tor. This may involve settings such as the port on which Tor listens, bandwidth limits, logging preferences, and whether the system should act as a relay or only as a client.

3. **Bridge Configuration:**
   - For users in regions with restricted access to the Tor network, the `torrc` file allows the configuration of bridge relays. Bridge relays help users bypass censorship by providing an alternative entry point to the Tor network.

4. **Hidden Service Configuration:**
   - Users hosting Tor hidden services can configure their services through the `torrc` file. This includes defining the service's port, authentication methods, and other related parameters.

5. **Logging and Debugging:**
   - The file provides options for configuring logging levels and debugging information. Users can tailor the amount of detail Tor logs, facilitating troubleshooting and analysis.

6. **Security Settings:**
   - Various security-related options can be configured in the `torrc` file, such as restricting certain features or specifying the behavior of Tor in response to specific security events.

7. **Network and Protocol Settings:**
   - Users can fine-tune Tor's network and protocol settings in the `torrc` file, influencing aspects such as circuit creation, DNS resolution, and transport protocols.

Customizing the `torrc` file allows users to tailor Tor's behavior to their specific needs and security requirements. However, users should exercise caution and adhere to Tor's best practices to ensure the continued effectiveness and anonymity of their Tor usage.

> See the [sources](#sources) section for more on this topic.

## Tor University Challenge by EFF

*Off-Topic*

![](https://www.eff.org/files/banner_library/banner-tor-monions.png)

Tor is a valuable tool for browsing the web anonymously, but since it's powered by volunteers willing to share some bandwidth and a computer, it's always in need of additional help. Which is why EFF is announcing the Tor University Challenge, a project asking universities to start running Tor relays on campus. Today, we're launching with support from 12 universities. With your help, we can add more universities to strengthen the Tor network to improve one of the best free privacy tools available today.

*Source: https://www.eff.org/deeplinks/2023/08/announcing-tor-university-challenge*

> If you are interested in finding out more about Tor and EFF's initiative, you can learn more at the official page of [Tor University Challenge](https://toruniversity.eff.org/).

## Sources

1. Passive Windows Detect - https://github.com/hak5/usbrubberducky-payloads/blob/master/payloads/extensions/passive_windows_detect.txt
2. Select the relays - https://metrics.torproject.org/rs.html
3. torrc - https://support.torproject.org/glossary/torrc/
4. Official torrc documentation and so on - https://2019.www.torproject.org/docs/tor-manual.html.en
5. Tor University Challenge - https://toruniversity.eff.org/


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