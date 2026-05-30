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

This payload sets up a trustworthy proxy for the user, enabling a Man-in-the-middle attack.

## Process

1. Detects when the USB Rubber Ducky is ready and whether the target operating system is Windows.
2. Creates a new virtual desktop.
3. Opens PowerShell from the Windows quick link menu (Win+X).
4. Downloads your root certificate, optionally configures Firefox, and enables the system proxy for the current user.
5. Clears the temporary certificate file and PowerShell command history, then exits the session.
6. Confirms the trusted certificate prompt and closes the virtual desktop.
7. Disables the USB Rubber Ducky when `DISABLE_AFTER_EXECUTION` is enabled.

> [!NOTE]
> No configuration is required for Chromium-based browsers since they accept user root certificates by default.

## Prerequisites

You need a proxy server and a [root certificate](https://en.wikipedia.org/wiki/Root_certificate) downloadable from a
URL (`CERT_URL`). Host the certificate on your proxy server or a file hosting service such
as [Dropbox](https://www.dropbox.com/). Generate certificates with tools such as [mitmproxy](https://mitmproxy.org/)
or [Burp Suite](https://portswigger.net/burp).

> [!WARNING]
> When using mitmproxy, generate the `mitmproxy-ca-cert.pem` certificate under **Other platforms**.

> [!WARNING]
> If you host the certificate on Dropbox, use a download link ending with `dl=1`, not `dl=0`.

## Options

### Required

| Option       | Type    | Default       | Description                                        |
|--------------|---------|---------------|----------------------------------------------------|
| `CERT_URL`   | String  | `example.com` | Download link for your trusted root CA certificate |
| `PROXY_IP`   | String  | `127.0.0.1`   | Proxy server IP address                            |
| `PROXY_PORT` | Integer | `8080`        | Proxy server port                                  |

### Advanced payload options

| Option                    | Type    | Default | Description                                                    |
|---------------------------|---------|---------|----------------------------------------------------------------|
| `SHORT_DELAY`             | Integer | `500`   | Short delay (ms)                                               |
| `MEDIUM_DELAY`            | Integer | `2000`  | Medium delay (ms)                                              |
| `LONG_DELAY`              | Integer | `4000`  | Long delay (ms)                                                |
| `CONFIGURE_FIREFOX`       | Boolean | `TRUE`  | Configures Firefox to trust root user certificates per profile |
| `DISABLE_AFTER_EXECUTION` | Boolean | `TRUE`  | Disables the USB Rubber Ducky after execution                  |

## Contributors

- [PlumpyTurkey](https://codeberg.org/PlumpyTurkey)
