# Add An Excepiton To Avast Antivirus

This script can be used to put an arbitrary exception path in the Avast app.

**Category**: Execute

## Description

This script can be used to put an arbitrary exception path in the Avast app.

The script open the Avast app, then go to menu, then go to, avast settings, then go to exception menu, then click the add exception button, then write the full-path defined before and save it, then close the app.

Choosing a specific file, folder, or website will exclude it from all Avast shields and scans, so be very careful when using this payload because it can concretely cause damage to your machine.

- You must edit the FULL-PATH with the path that you want to set as exception in the payload.txt file

```DuckyScript
REM Set the full-path that you want to set as exception
DEFINE FULL-PATH example/to/path
```

### Dependencies

* The target must have **Avast installed** and **configured** on the machine