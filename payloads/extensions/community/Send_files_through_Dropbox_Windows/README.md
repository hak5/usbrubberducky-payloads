# Send Files Through Dropbox - Windows

This extension can be used to send one or more files through the Dropbox API without having to copy and paste reused code every time, but standardizing a methodology that avoids errors.

```
How many files do you want to exfiltrate?
|
|-- Single File
|   |
|   |-- Do you already know the full file path? (e.g., C:\Users\Aleff\Downloads\photo.png)
|   |   |
|   |   |-- Use the SINGLE-FILE version
|   |   |   |
|   |   |   |-- Set #FLAG-SINGLE-FILE to TRUE
|   |   |   |-- Define the file path in #SINGLE-PATH
|   |   |
|   |-- Don't know the full path but can obtain it at runtime through PowerShell?
|   |   |
|   |   |-- Use the $dropboxFilePath variable
|   |   |   |
|   |   |   |-- Set #FLAG-SINGLE-FILE to TRUE
|   |   |   |-- Obtain the file path through PowerShell and assign it to $dropboxFilePath
|
|-- Multiple Files
|   |
|   |-- Set the #FLAG-SINGLE-FILE variable to FALSE
|   |   |
|   |   |-- Use an array of strings named $dropboxFilePaths to collect the paths of all the files you want to use

```


## Target Environment

- **Target**: Windows PowerShell

## Usage

Insert this extension when you have one or more files that you want to send or exfiltrate via Dropbox.

## Configuration

Before using the extension, you need to configure it by setting certain variables in the DuckyScript payload. Here are the configuration options:

### 1. Dropbox Access Token

- **Variable**: #DROPBOX_ACCESS_TOKEN
- **Type**: String
- **Description**: You must set this variable with your personal Dropbox access token, which you can obtain from your Dropbox account.

Example in DuckyScript:
```DuckyScript
DEFINE #DROPBOX_ACCESS_TOKEN YOUR_DROPBOX_ACCESS_TOKEN
```

### 2. Single File or Multiple Files

You can choose to send a single file or multiple files. Configure the extension accordingly.

#### Single File Configuration

- **Variable**: #FLAG-SINGLE-FILE
- **Type**: Boolean (TRUE or FALSE)
- **Description**: Set #FLAG-SINGLE-FILE to TRUE if you want to send just one file. In this case, you will need to specify the file path within the #SINGLE-PATH variable. Alternatively, you can acquire the file path at runtime via PowerShell and store it in the $dropboxFilePath variable.

Example in DuckyScript:
```DuckyScript
DEFINE #FLAG-SINGLE-FILE TRUE
DEFINE #SINGLE-PATH C:\Users\Aleff\Downloads\photo.png
```

Example in PowerShell before using the extension:
```powershell
$dropboxFilePath = "C:\Users\Aleff\Downloads\photo.png"
```

#### Multiple Files Configuration

- **Variable**: #FLAG-SINGLE-FILE
- **Type**: Boolean (TRUE or FALSE)
- **Description**: Set #FLAG-SINGLE-FILE to FALSE if you want to send multiple files. In this case, in PowerShell, you will have to create the variable $dropboxFilePaths, which is an array of strings containing the list of paths related to the files you want to export.

Example in PowerShell before using the extension:
```powershell
$dropboxFilePaths = @(
    "C:\Users\Aleff\Downloads\photo.png",
    "C:\Users\Aleff\Downloads\document.pdf",
    "C:\Users\Aleff\Downloads\song.mp3"
)
```

**Tips for Working with Arrays in PowerShell:**

- How to create an array:
  ```powershell
  $dropboxFilePaths = @()
  ```

- How to add an element to the array:
  ```powershell
  $dropboxFilePaths += "C:\Users\Aleff\Downloads\photo.png"
  ```

- How to view the array:
  ```powershell
  $dropboxFilePaths
  ```

That's it! You can now use this extension with the appropriate configuration to send files via the Dropbox API using USB Rubber Ducky.

