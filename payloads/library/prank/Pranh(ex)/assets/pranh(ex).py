import ctypes
from time import sleep

def show_error_popup(message):
    while True:
        result = ctypes.windll.user32.MessageBoxW(None, message, 'Errore', 0x10 | 0x1)  # 0x10 = MB_ICONERROR, 0x1 = MB_OK
        if result == 1:  # 1 is OK
            message = "What do you believe yourself? That I leave so easily?"
            continue  # Open the popup
        elif result == 2:  # 2 is Cancel
            result = ctypes.windll.user32.MessageBoxW(None, "Are you sure you want to close? I will miss you :'(", 'Chiusura', 0x10 | 0x4)  # 0x10 = MB_ICONERROR, 0x4 = MB_YESNO
            if result == 6:  # 6 is "Yes"
                ctypes.windll.user32.MessageBoxW(None, "Okay, I'll stop. But don't get mad...", 'Informazione', 0x40)  # 0x40 = MB_ICONINFORMATION
                break  # Close the popup
            else:
                message = "You seem a little indecisive honestly...."
                continue  # Open the popup

error_message = "Yoh bro be very careful with executables!"
show_error_popup(error_message)
sleep(60) # Time-Based Easter Egg ^^
ctypes.windll.user32.MessageBoxW(None, "However, know that you remain in my heart, yay for DuckyScrip and Hak5. ^^", 'Informazione', 0x40)