import os

try:
    import pyautogui
except:
    os.system("pip install pyautogui")
    import pyautogui

from time import sleep

from PIL import Image
import ctypes


# Edit this time as you want...
sleep(30) 
screenshot = pyautogui.screenshot()
screenshot.save("screenshot.png")

img = Image.open('screenshot.png')

# Resize the screenshot as the desktop resolution
user32 = ctypes.windll.user32
screensize = user32.GetSystemMetrics(0), user32.GetSystemMetrics(1)
img = img.resize(screensize)

# Set the new wallpaper
image_path = os.path.abspath('screenshot.png')
ctypes.windll.user32.SystemParametersInfoW(20, 0, image_path, 0)