# Send WhatsApp Messages - MacOS

This script is written in **DuckyScript 3.0** and enables automatic sending of a message via **WhatsApp** on an **MacOS** device. The script waits until the system is ready (using **Caps Lock** detection as an indicator), then launches WhatsApp, types a predefined message, and sends it.

### Details

- **Title**: Send WhatsApp Messages - MacOS
- **Author**: bst04 - Aleff
- **Version**: 1.0
- **Category**: Prank
- **Target**: MacOS devices

### Dependencies

- Enter the phone number to which you want to send the message via Whatsapp

   `DEFINE #PHONE-NUMBER example`

- Set the text message that you want to send

   `DEFINE #TEXT-MESSAGE example`

### How It Works

1. Sets a user-defined text message (`#TEXT-MESSAGE`) to be sent via WhatsApp to the number defined too (`#PHONE-NUMBER`).
2. Uses an extension (`EXTENSION DETECT_READY`) to detect when the device is ready with just a littebit more delay...
3. After readiness is confirmed, the script:
   - Runs commands to open **WhatsApp**.
   - Types the specified phone number to open the chat
   - Types the message and sends it.
