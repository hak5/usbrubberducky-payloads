# Windows Check Battery

This script is a Rubber Ducky payload designed for Windows environments to check battery information and save files to a USB Rubber Ducky storage. The script performs two primary functions:

1. **Battery Report Generation**: It retrieves the battery report using PowerShell.
2. **File Saving Functionality**: It can save one or more files to the USB Rubber Ducky storage, based on the configuration.

### Details

- **Title**: Windows Check Battery
- **Author**: bst04 - Aleff
- **Version**: 1.0
- **Category**: Exfiltration
- **Target**: Windows

---

### Dependencies

- Do not change the definition name `#SINGLE_PATH` but only the value given `/batteryreport` as it is used in the extension used to exfiltrate the file.

    `DEFINE #SINGLE_PATH /batteryreport`

- Be careful to change the configuration data of the extension used to exfiltrate the file. All information is within the annotated block.

    ```
        DEFINE #DRIVER_LABEL DUCK
        DEFINE #FLAG_SINGLE_FILE TRUE
    ```

## How It Works 📜

1. Sets a user-defined path `#SINGLE_PATH`.
2. Uses the extension `EXTENSION PASSIVE_WINDOWS_DETECT` to detect when the device is ready...
3. After readiness is confirmed, the script:
   - Runs commands to open **Powershell**.
   - Execute the command `powercfg #SINGLE_PATH`
4. Uses the extension `SAVE_FILES_IN_RUBBER_DUCKY_STORAGE_WINDOWS` to save the file into the Rubber Ducky Storage
