# Create RickRoll Contact - iOS

This payload is a prank script designed to create a contact named "Ricky Astley" (a nod to the "RickRoll" meme) on an iOS device. It utilizes a dynamic delay mechanism to ensure the system is ready before executing commands. The automated process opens the Contacts app, creates a new contact, and fills in various fields with predefined information: name, last name, phone number, email, website, and other optional details. The fake contact serves as a lighthearted prank, silently inserting a “RickRoll” in the form of a contact entry.

### Details

- **Title**: Create RickRoll Contact
- **Author**: bst04 - Aleff
- **Version**: 1.0
- **Category**: Prank
- **Target**: iOS devices

### Dependencies

- We believe that these 4 pieces of information are critical to making contact, even if it is for fun.

    ```
    DEFINE #CONTACTS-APP-NAME Contacts
    DEFINE #CONTACT-NAME Ricky
    DEFINE #CONTACT-LAST-NAME Astley
    DEFINE #CONTACT-PHONE-NUMBER +1(111)111-1111
    ```

- Other optional DEFINEs

    ```
    DEFINE #CONTACT-COMPANY example
    DEFINE #CONTACT-E-MAIL example
    DEFINE #CONTACT-WEBSITE-URL example
    DEFINE #CONTACT-BIRTHDAY example
    DEFINE #CONTACT-STREET example
    DEFINE #CONTACT-CITY example
    DEFINE #CONTACT-STATE example
    DEFINE #CONTACT-ZIP example
    DEFINE #CONTACT-COUNTRY example
    ```

- Note that if you don't want to set some settings you have to remove the piece of code that sets it as well, for istance...

    If you want to remove the zip contact info, you should change this one piece of code from this...

    ```
    REM zip
    DELAY 250
    STRING #CONTACT-ZIP
    TAB
    ```

    ... to this...
    
    ```
    REM zip
    DELAY 250
    REM STRING #CONTACT-ZIP
    TAB
    ```

    In this way you are going to ignore this step but without altering the proper flow of available information.

### How It Works

1. Sets a user-defined options.
2. Uses an extension (`EXTENSION DETECT_READY`) to detect when the device is ready with just a littebit more delay...
3. After readiness is confirmed, the script:
   - Runs commands to open **Contacts**.
   - Executes some commands to sets the new contact information
