# Edit The Default Real App With An Arbitrary

A script used to download a modified application on the target computer that will be executed insted off the original one without notify it to the user.

**Category**: Execution

## Description

A script used to download a modified application on the target computer that will be executed insted off the original one without notify it to the user.

The script will download the zip archive in wich you should have the modified application, then unzip the archive and remove the original zip, then replace the original desktop file with the one that is present on the archive.

## Getting Started

### Dependencies

* sudo permissions
* Internet Connection
* Original application installed 

### Settings

- Set the link from which to download the zipper archive
```DuckyScript
DEFINE ARBITRARY_APP_LINK example
```

- You must set the desktop file path present in the zip file, if i.e. you have the app name Signal and the desktop file path is Signal/files/signal you should put the path Signal/files/signal
```DuckyScript
DEFINE PATH_TO_DESKTOP_FILE example/path
```

- You must know the original desktop name file, if you don't know it you can rich this information download the app on you system and going to /usr/share/applications/ searching this one app, i.e. the desktop file name of Signal application is signal-desktop.desktop, so in this case you should put signal-desktop.desktop
```DuckyScript
DEFINE ORIGINAL_DESKTOP_FILE_NAME example
```