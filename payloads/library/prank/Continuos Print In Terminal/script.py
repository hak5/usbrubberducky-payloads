import os
os.system("pip install colorama")
import colorama
import random
from time import sleep


colorama.init()

while True:
    color = random.choice([colorama.Fore.RED, colorama.Fore.GREEN, colorama.Fore.YELLOW])
    print(color + "Your computer is infected!")
    sleep(0.1) 
