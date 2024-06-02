# Windows Duck In The Middle

<p>
    <a href="https://payloadstudio.hak5.org/community/?device=usb-rubber-ducky&viewurl=https://raw.githubusercontent.com/hak5/usbrubberducky-payloads/master/payloads/library/execution/Windows-Duck-In-The-Middle/payload.txt">
        <img alt="VIEW ON: HAK5 PAYLOADSTUDIO" src="https://img.shields.io/badge/VIEW_ON-HAK5_PAYLOADSTUDIO-red?style=for-the-badge">
    </a>
    <a href="#">
        <img alt="TARGET: WINDOWS 10, 11" src="https://img.shields.io/badge/TARGET-WINDOWS_10,_11-blue?style=for-the-badge">
    </a>
    <a href="#">
        <img alt="VERSION: 1.0" src="https://img.shields.io/badge/VERSION-1.0-green?style=for-the-badge">
    </a>
</p>

This payload sets up a trustworthy proxy for the user, enabling a [Man-in-the-middle attack](https://en.wikipedia.org/wiki/Man-in-the-middle_attack). After executing your payload, the proxy server will intercept all the target user's network traffic.

## Process

1. Detects when the USB Rubber Ducky is ready and whether the target operating system is Windows.
2. Creates a new virtual desktop.
3. Opens a PowerShell window using the Windows+X menu.
4. Runs PowerShell code that performs the following actions:
- Downloads your certificate to a temporary file.
- *Configures Firefox to accepts root user certificates for each profile.*
- Configures and activates the proxy for the current user.
- Deletes the temporary certificate file and PowerShell history, then closes the window.
5. Confirms the addition of a trusted certificate in the confirmation dialog box.
6. Closes the virtual desktop.
7. *Disables USB Rubber Ducky*

> [!NOTE]
> No configuration is required for Chromium-based browsers since they accept user root certificates by default.

## Prerequisites

To use this payload, you'll need a proxy server and a [root certificate](https://en.wikipedia.org/wiki/Root_certificate). The certificate must be downloadable from a website, either from your proxy server or from an online file hosting service such as [Dropbox](https://www.dropbox.com/). You can easily generate the certificate using tools such as [mitmproxy](https://mitmproxy.org/) or [Burp Suite](https://portswigger.net/burp).

> [!WARNING]
> To ensure the payload functions properly, generate the "mitmproxy-ca-cert.pem" certificate in the "Other platforms" section when using mitmproxy.

## Options

|Required options|Data type|Default value|Description|
|-|-|-|-|
|CERT_URL|String|example.com|The download link for your Trusted Root CA certificate|
|PROXY_IP|String|127.0.0.1|Your proxy's IP address|
|PROXY_PORT|Integer|8080|Your proxy port|

|Advanced options|Data type|Default value|Description|
|-|-|-|-|
|SHORT_DELAY|Integer|500|Short delay time|
|MEDIUM_DELAY|Integer|2000|Medium delay time|
|LONG_DELAY|Integer|4000|Long delay time|
|CONFIGURE_FIREFOX|Boolean|TRUE|Configures Firefox to accepts root user certificates for each profile|
|DISABLE_AFTER_EXECUTION|Boolean|TRUE|Disables USB Rubber Ducky after payload execution|

## Contributors

- [PlumpyTurkey](https://codeberg.org/PlumpyTurkey)
