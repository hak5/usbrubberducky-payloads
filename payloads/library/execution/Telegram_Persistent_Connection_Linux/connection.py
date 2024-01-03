from telebot import TeleBot

# Set here the Telegram bot token
BOT_TOKEN = ""
bot = TeleBot(BOT_TOKEN)

@bot.message_handler(commands=['start'])
def send_welcome(message):
	bot.reply_to(message, "Ok it works")

bot.infinity_polling()
