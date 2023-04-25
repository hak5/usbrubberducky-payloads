import os
from time import sleep
try:
    import pyttsx3
except:
    os.system("pip install pyttsx3")
    import pyttsx3
        

# How much time you want to wait before speak
sleep(60)

alien_message = 'Greetings to the inhabitants of planet Earth. I am an alien from a distant planet named Hak5 and I have taken control of this computer to communicate with you. I want to announce to you that in exactly one year\'s time our invasion fleet will arrive on your planet because we have heard that you make very good fries. Resistance is useless. Your only option is to give us all the fries you have and to produce as many as possible to satiate us. Your planet will become a potato chip colony and you will produce forever. Get ready, earthlings. Our hunger is near.'

motore = pyttsx3.init()

# Set alien voice
voce_alienea = motore.getProperty('voices')[1]
motore.setProperty('voice', voce_alienea.id)

# Set the pitch property to make the voice more alien-like
motore.setProperty('pitch', 70)

motore.say(alien_message)
motore.runAndWait()