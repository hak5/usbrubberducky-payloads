# "X-Frame-Options" Scanner

- Title:         "X-Frame-Options" Scanner
- Author:        TW-D
- Version:       1.0
- Category:      Recon

## Description

Uses the "Microsoft Edge" web browser to search for web servers within 
a range of IPv4 addresses that do not have an "X-Frame-Options" header.

Then exports the results to a PDF file accessible in the Rubber Ducky.

The results contain the tested IPv4 addresses and the HTML rendering.

## Tested On

>
> Microsoft Edge (Windows 10)
>

| X-Frame-Options | Encryption | Detectable |
| --- | --- | --- |
| None | None | Yes |
| Set to SAMEORIGIN | None | No |
| Set to SAMEORIGIN | Self-Signed Certificate | No |

__NOTE :__ *All cases could not be tested.*

## Configuration

In the "payload.txt" file, replace the values of the following constants :

```

REM ---
REM USB Rubber Ducky label.
REM ---
DEFINE #RD_LABEL DUCKY

REM ---
REM Format of an allowed IPv4 address range.
REM 192.168.0.X-192.168.0.Y where (X < Y)
REM ---
DEFINE #LAN 192.168.0.1-192.168.0.50

```

## Advanced Configuration

In the "main.js" file available in the "recon_files/assets/js/" directory, 
you can add new ports to be tested for each host :

```js
if (LAN) {
    Promise.all(
        [
            ...,
            recon('http', 8080),
            recon('https', 8443)
        ]
    );
}
```

## Usage

At the root of the USB Rubber Ducky, copy the "recon_files/" folder.
