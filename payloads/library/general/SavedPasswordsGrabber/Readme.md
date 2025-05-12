<html>
  <body>
  <h1>DEMO</h1> 
  <img src="https://github.com/user-attachments/assets/518e6e26-ca02-4b58-90f0-fb0e95fac2d3">
  <h1>Getting Saved Passwords</h1>
  <p>Getting Saved Passwords Using Rubber Ducky from a computer.</p>
  <p>I used a bat file which directly downloads in pc and runs, this makes it very quick and we can remove the rubber ducky in like 3 seconds as the else will be done on its own!</p>
  </body>

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

</html>
