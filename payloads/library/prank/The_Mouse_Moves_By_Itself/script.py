import os
try:
    import pyautogui
except:
    os.system("pip install pyautogui")
    import pyautogui
import random
import time

while True:
    # Move the mouse cursor randomly
    x_offset = random.randint(-250, 250)
    y_offset = random.randint(-250, 250)
    pyautogui.moveRel(x_offset, y_offset, duration=0.25)
    time.sleep(0.1)  # 1 second delay
