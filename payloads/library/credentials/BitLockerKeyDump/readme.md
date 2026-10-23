**Title: BitLockerKeyDump**

<p>Author: 0i41E<br>
OS: Windows<br>
Version: 1.0<br>

**What is BitLockerKeyDump?**

#
<p>Lets first explain, what is "a BitLocker recovery key"?

A BitLocker recovery key is a unique 48-digit numerical password that is generated when you enable BitLocker on a Windows computer or device. 
BitLocker is a disk encryption program included with Windows, and is designed to protect the data on your hard drive by encrypting it. 
The recovery key is a critical component of BitLocker because it is used to unlock or recover access to the encrypted drive in case you forget your BitLocker password or experience issues with your computer's hardware or software.
Common scenarios where you might need a BitLocker recovery key:
- Forgotten Password: If you forget the password you set for BitLocker, you can use the recovery key to regain access to your encrypted drive.
- Hardware Changes: If you make significant hardware changes to your computer, such as replacing the motherboard or hard drive, BitLocker may trigger a recovery mode, and you'll need the recovery key to unlock the drive.
- Operating System Errors: In the event of certain operating system errors or issues, BitLocker may require the recovery key to restore access to the encrypted drive.

It's important to keep your BitLocker recovery key in a safe and secure location because it provides a way to bypass BitLocker's encryption and access your data.</p>

Now that we have explained what BitLocker and the recovery key are, what is BitLockerKeyDump? Short and easy: It dumps the recovery key and exfiltrates it via Keystroke Reflection.



**Instructions:**
1. Set the correct "Yes" shortcut in line 132. (i.e. `ALT j` for german systems, `ALT y` for english keyboard layouts)

2. Plug in your RubberDucky into a Windows target and wait for the process to end. Have fun observing the Keyboards LEDs ;)

_*If plugged into a non Windows system, `ATTACKMODE OFF` will be triggered, unless `CAPSLOCK` is ON while the Ducky is getting plugged in. This way you can collect the loot savely._

3. Open the exfiltrated loot.bin file to access the recovery key.