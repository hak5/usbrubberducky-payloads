# Uninstall A Specific App On Windows Through Control Panel

This script can be used to uninstall a specific app on a Windows System.

**Category**: Execute

## Description

This script can be used to uninstall a specific app on a Windows System.

The script opens the research app and go to `Uninstall or change a program` page using the default path `Control Panel\Programs\Programs and Features`, then go to the search bar and write the app name, then got on the app, press space to select and enter to uninstall it.

When uninstalling an application through the Windows Control Panel, it may not always be enough, especially for complex programs like antivirus software. In such cases, specific uninstaller applications are often required to ensure the complete removal of all components and avoid leaving behind residual files or registry entries. While most standard applications can be successfully uninstalled through the Control Panel, complex or security-related programs may benefit from using specific uninstaller applications for a more thorough and complete removal and, in that cases, this script doesn't work.

**Unauthorized removal of an application is considered a crime** and can result in severe consequences. Tampering with system files without permission violates cybersecurity laws and can lead to legal penalties.

In addition to legal implications, **unauthorized removal of an application can also pose permanent risks to files and system functionality**. Applications are designed to work within a specific environment, and sudden or improper removal can cause instability, errors, and permanent data loss.

## Dependencies

* Set the exact name of the application as it appears within the control panel. Do not assume that just because an application is known by a certain name then it will have exactly that name, e.g. `Firefox` shows up again as `Mozilla Firefox (x64 en)`

    ```DuckyScript
    DEFINE APP_NAME example
    ```