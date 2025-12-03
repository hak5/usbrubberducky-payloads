# SSH Key And Cert Exfiltration Cross-Platform PoC

This payload can be used to automatically collect SSH keys and small cryptographic key/certificate files from the current user profile and save them into the USB Rubber Ducky storage, standardizing the logic and avoiding copy-paste errors.

> ⚠️ **Legal notice**
> Use this payload only on systems you own or are explicitly authorized to test (lab, red-team, training).  
> Unauthorized use may be illegal and could lead to disciplinary, civil, or criminal consequences.

## Target

  * Windows – PowerShell
  * Linux – bash
  * macOS – zsh / Terminal


```text
Paylod Execution
|
|-- Let the payload adapt to the target OS trough OS_DETECTION extension
    |
    |-- Windows/Linux/MacOS
    |   |
    |   |-- Open a Powershell/Bash/ZSH Terminal
    |   |
    |   |-- Identify the reference of the volume you want to use as storage and create the directory 'keys'
    |   |   |
    |   |   |-- For GNU/Linux and Mac It is necessary to mount
    |   |   |
    |   |-- If the ssh key path* exists, copy it
        |   |
        |   |-- For Windows*: $env:USERPROFILE\.ssh\id_rsa
        |   |
        |   |-- For GNU/Linux*: $HOME/.ssh/id_rsa
        |   |
        |   |-- For MacOS*: ~/.ssh/id_rsa
    |   |   |
    |   |-- If it was not possible to capture the SSH keys via the traditional path, then we perform a search with the following characteristics
        |   |
        |   |-- Smaller than 10 KB
        |   |-- File Name Start with 'id_rsa'
        |   |-- The File Contains The SubString 'OPENSSH PRIVATE KEY'
    |   |   |
    |   |-- If it has not been possible to acquire any further material, then we carry out an in-depth search.
    |   |   |
        |   |-- Maximum Search Depth: 3 levels
        |   |-- File Type: Regular files only
        |   |-- File Size: Smaller than 10 KB
        |   |-- File Extensions Matched (case-insensitive):
        |   |   |-- *.pem
        |   |   |-- *.key
        |   |   |-- *.rsa
        |   |   |-- *.cer
        |   |   |-- *.der
        |   |   |-- *.pfx
        |   |   |-- *.p12
        |   |
        |-- For each file found:
            |
            |-- if the file name ends with `.crt`:
            |   |
            |   |-- Copy the entire directory containing the `.crt` file to DEST_PATH
            |
            |-- else:
            |   |
            |   |-- Copy only the file itself to DEST_PATH
        |   |
    |   |-- Soft delete of tracks
    |   |
    |   |-- Close Terminal

```

## Usage

Insert this payload when you want to automatically save your SSH keys and small cryptographic key/certificate files from the current user profile to the USB Rubber Ducky storage, regardless of whether the host is running Windows, Linux, or macOS.

At a high level, when the payload runs it:

1. Uses the `OS_DETECTION` extension to determine the current operating system.
2. Based on the detected OS, opens the appropriate shell (PowerShell, terminal, or Terminal.app).
3. Locates the USB mass-storage device whose **volume label** matches `#FileSystemLabel`.
4. Creates a `keys` directory on that device.
5. Searches the current user’s profile (`%USERPROFILE%` / `$HOME`) for SSH private keys and small key/certificate files.
6. Copies the matching files into:

   * `X:\keys` on Windows
   * `<mountpoint>/keys` on Linux and macOS
7. Performs a basic clean-up of history/session data on the host shell before closing.

Use this only in controlled environments to demonstrate risk and improve defenses.

## Configuration

Before using the payload, configure the variables in the DuckyScript.

### Storage Volume Label

The payload scans the host volumes and tries to identify your USB Rubber Ducky (or any USB storage you’re using) based on its **filesystem label**.

* **Variable**: `#FileSystemLabel`
* **Description**: Label of the USB storage volume where collected files will be saved.
* **Example**:

```DuckyScript
DEFINE #FileSystemLabel DUCK
```

Ensure that the label you set in `#FileSystemLabel` matches the actual volume label of the USB storage device.

Here is a **short English explanation** for both items:

### Size Of Other Files

Generally, 10 kb is sufficient for a certificate, but sometimes it may not be enough. If you know that your file exceeds this size and you still want to be able to store it, then you just need to change this reference.

#### For find command in GNU/Linux and MacOS

**Meaning:** the value must be written with the **`k` suffix**, e.g., `10k`.

```DuckyScript
REM For example, for 10 KB in a find command you write: 10k
DEFINE #SizeOfOtherFilesInFind 10k
```

#### For Length command in Windows

**Meaning:** the value is the **full byte number**, e.g., `10240` for 10 KB.

```DuckyScript
REM For example, for 10 KB you must enter: 10240
DEFINE #SizeOfOtherFilesInLength 10240
```

### OS Detection Configuration

The payload embeds the `OS_DETECTION` extension, which relies on HID behavior and keyboard LED feedback to guess the host operating system and set the `$_OS` variable accordingly.

### High-Level Behavior per OS

#### Windows

* Opens **Run** (`WIN + R`) and launches **PowerShell**.
* Identifies the drive letter of the USB storage device whose label matches `#FileSystemLabel`.
* Creates `X:\keys` on that device.
* Searches under `%USERPROFILE%` for:

  * `id_rsa*` in `%USERPROFILE%\.ssh\`
  * small files containing `OPENSSH PRIVATE KEY`
  * small files with extensions `.pem`, `.key`, `.rsa`, `.crt`, `.cer`, `.der`, `.pfx`, `.p12`
* Copies all matching files (or directories for `.crt`) into `X:\keys`.
* Clear the last command from the PowerShell history to reduce visible traces, then exits.

#### Linux

* Opens a terminal (usually via `CTRL + ALT + T`).
* Uses `lsblk` and `udisksctl` to locate and mount the device whose label matches `#FileSystemLabel`.
* Determines the mountpoint and creates `<mountpoint>/keys`.
* Searches under `$HOME` for:

  * `~/.ssh/id_rsa*`
  * small files containing `OPENSSH PRIVATE KEY`
  * small files with extensions `.pem`, `.key`, `.rsa`, `.crt`, `.cer`, `.der`, `.pfx`, `.p12` (limited depth)
* Copies the found files (and directories for `.crt`) into `<mountpoint>/keys`.
* Unmounts and powers off the device with `udisksctl`, clears the shell history via `history -c`, and exits.

#### macOS

* Opens **Spotlight** (`CMD + SPACE`) and starts **Terminal**.
* Uses `diskutil` to find and mount the volume whose label matches `#FileSystemLabel`.
* Determines the mountpoint and creates `<mountpoint>/keys`.
* Searches under `$HOME` for:

  * `~/.ssh/id_rsa*`
  * small files containing `OPENSSH PRIVATE KEY`
  * small files with extensions `.pem`, `.key`, `.rsa`, `.crt`, `.cer`, `.der`, `.pfx`, `.p12`
* Copies all matching items to `<mountpoint>/keys` (copying directories for `.crt` files).
* Removes `~/.zsh_sessions/` to clear zsh interactive session traces and closes Terminal.

## Notes

* This payload is intended for **defensive research, labs, and authorized engagements only**.
* It demonstrates how keystroke-injection devices combined with USB storage can exfiltrate sensitive material like SSH keys and certificates.
