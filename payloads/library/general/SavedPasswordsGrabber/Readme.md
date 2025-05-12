<html>
  <body>
  <h1>DEMO</h1> 
  <img src="https://github.com/user-attachments/assets/518e6e26-ca02-4b58-90f0-fb0e95fac2d3">
  <h1>Getting Saved Passwords</h1>
  <ul>
  <li>Getting Saved Passwords Using Rubber Ducky from a computer.</li>
  <li>Localstate and Login data files are Exfiltrated</li>
  <li>Using a bat file which directly downloads on pc and runs, this makes the attack very quick, we can remove the rubber ducky within 3-4 seconds as the attack will take place on its own!</li>
  </ul>
  <h1>What is going on?</h1>
  <ol>
    <li>We are using powershell to download batch file in victim's pc.</li>
    <li>Batch file will try to get 'localstate' & 'login data' file of common web browsers.</li>
    <li>When it gets them, it will transfer all of them to your discord server through your provided discord webhook.</li>
    <li>Now we can decrypt localstates using a python file which I have uploaded called "decrypt.py"</li>
  </ol>

  <h1>What is localstate?</h1>
  <ol>
    <li>It is a JSON file located in browser user data directory</li>
    <li>This file contains settings and information</li>
    <li>One of the information is encrypted password </li>
  </ol>
  <h1>Source: </h1> 
  <p>https://github.com/Tarnishsilver/usbrubberducky-payloads/tree/master</p>
</body>
</html>
