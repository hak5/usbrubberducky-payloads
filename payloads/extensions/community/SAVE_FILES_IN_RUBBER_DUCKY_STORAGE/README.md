# Save Files In Rubber Ducky Storage - Windows

This extension can be used to save one or more files through the USB Rubber Ducky storage without having to copy and paste reused code every time, but standardizing a methodology that avoids errors.

```
How many files do you want to save?
|
|-- Single File
|   |
|   |-- Do you already know the full file path? (e.g., C:\Users\Aleff\Downloads\photo.png)
|   |   |
|   |   |-- Use the SINGLE_FILE version
|   |   |   |
|   |   |   |-- Set #FLAG_SINGLE_FILE to TRUE
|   |   |   |-- Define the file path in #SINGLE_PATH
|   |   |
|   |-- Don't know the full path but can obtain it at runtime through PowerShell?
|   |   |
|   |   |-- Use the $fileToSavePath variable
|   |   |   |
|   |   |   |-- Set #FLAG_SINGLE_FILE to TRUE
|   |   |   |-- Obtain the file path through PowerShell and assign it to $fileToSavePath
|
|-- Multiple Files
|   |
|   |-- Set the #FLAG_SINGLE_FILE variable to FALSE
|   |   |
|   |   |-- Use an array of strings named $fileToSavePaths to collect the paths of all the files you want to use

```


## Target Environment

- **Target**: Windows PowerShell

## Usage

Insert this extension when you have one or more files that you want to save via USB Rubber Ducky storage.

## Configuration

Before using the extension, you need to configure it by setting certain variables in the DuckyScript payload. Here are the configuration options:

### Driver Label

This extension utilizes the 'Get-Volume' command to scan the available volumes on the computer where the command is executed, aiming to detect our USB Rubber Ducky device. Upon detection, the device is selected to serve as a reference, allowing us to perform data saving operations. By default, USB Rubber Duckys are identified by the label 'DUCK'. However, this label can be altered, particularly if we want to keep the operation discreet. If the default label has been changed, it will be necessary to update the #DRIVER_LABEL variable with the correct label.

### Single File or Multiple Files

You can choose to send a single file or multiple files. Configure the extension accordingly.

#### Single File Configuration

- **Variable**: #FLAG_SINGLE_FILE
- **Type**: Boolean (TRUE or FALSE)
- **Description**: Set #FLAG_SINGLE_FILE to TRUE if you want to save just one file. In this case, you will need to specify the file path within the #SINGLE_PATH variable. Alternatively, you can acquire the file path at runtime via PowerShell and store it in the $fileToSavePath variable.

Example in DuckyScript:
```DuckyScript
DEFINE #FLAG_SINGLE_FILE TRUE
DEFINE #SINGLE_PATH C:\Users\Aleff\Downloads\photo.png
```

Example in PowerShell before using the extension:
```powershell
$fileToSavePath = "C:\Users\Aleff\Downloads\photo.png"
```

#### Multiple Files Configuration

- **Variable**: #FLAG_SINGLE_FILE
- **Type**: Boolean (TRUE or FALSE)
- **Description**: Set #FLAG_SINGLE_FILE to FALSE if you want to save multiple files. In this case, in PowerShell, you will have to create the variable $fileToSavePaths, which is an array of strings containing the list of paths related to the files you want to export.

Example in PowerShell before using the extension:
```powershell
$fileToSavePaths = @(
    "C:\Users\Aleff\Downloads\photo.png",
    "C:\Users\Aleff\Downloads\document.pdf",
    "C:\Users\Aleff\Downloads\song.mp3"
)
```

**Tips for Working with Arrays in PowerShell:**

- How to create an array:
  ```powershell
  $fileToSavePaths = @()
  ```

- How to add an element to the array:
  ```powershell
  $fileToSavePaths += "C:\Users\Aleff\Downloads\photo.png"
  ```

- How to view the array:
  ```powershell
  $fileToSavePaths
  ```

That's it! You can now use this extension with the appropriate configuration to save files via the USB Rubber Ducky storage using the same USB Rubber Ducky.

