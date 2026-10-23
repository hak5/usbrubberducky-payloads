**Title: FileHunter**

<p>Author: 0i41E<br>
OS: Windows<br>
Version: 1.0<br>

**What is FileHunter?**
#
It is pretty simple...
FileHunter crawls the systems drives and directories for either a specific file or a defined file type. Afterwards, all of these files get compressed and exfiltrated via the Ducky's Mass Storage functionality.

**Instructions:**
1. Set the file name in line 73. This can be a specific file like `example.pdf` or every file with a specific file type. You then have to set a wildcard in line 73 - For example `*.txt` - This will search and exfiltrate all txt-files.

2. Define your Ducky's name in line 74 - By default this usually is set to `Ducky`

3. Decompress the exfiltrated out.zip file to access the exfiltrated data.

***Notes:***

- The Rubber Ducky is really slow when it comes to transfering files. Therefore, exfiltrating large or multiple files can take quite a while. You have been warned ;P
- Searching a whole system for files can take some time, be patient.