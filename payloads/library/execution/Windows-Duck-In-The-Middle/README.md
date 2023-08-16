# Windows Duck In The Middle

The payload configures the target PC user to redirect network traffic via a proxy, enabling a [Man-in-the-middle attack](https://en.wikipedia.org/wiki/Man-in-the-middle_attack). After executing your payload, the proxy server will intercept all the target user's network traffic.

<details>
<summary>Payload operation</summary>

1. Create a new virtual desktop.
2. Open a PowerShell window using the Windows+x menu.
3. Run PowerShell code that performs the following actions:
- Download your certificate to a temporary file.
- *Configure Firefox to accept user root certificates for each profile.*
- Configure and activate the proxy for the current user.
- Delete the temporary certificate file and clear PowerShell history, then close the window.
4. Confirm the addition of a trusted certificate through the confirmation dialog box.
5. Close the virtual desktop.

> Note: No configuration is required for Edge and Chrome browsers, as they accept user root certificates by default.

</details>


## Prerequisites

To use this payload, you'll need a proxy server and a [root certificate](https://en.wikipedia.org/wiki/Root_certificate).
The certificate must be downloadable from a website, either from your proxy server or from an online file hosting service such as [Dropbox](https://www.dropbox.com). You can easily generate the certificate using tools such as [mitmproxy](https://mitmproxy.org) or [Burp Suite](https://portswigger.net/burp).

> Note: To ensure the payload functions properly, generate the "mitmproxy-ca-cert.pem" certificate in the "Other platforms" section when using mitmproxy.


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
|CONFIGURE_FIREFOX|Boolean|TRUE|Configure Firefox to accept user root certificates for each profile|


## Authors

- [@Who-Is-Julien](https://github.com/Who-Is-Julien)
