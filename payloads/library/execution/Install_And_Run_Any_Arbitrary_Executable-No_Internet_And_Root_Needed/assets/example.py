import ctypes

ctypes.windll.user32.MessageBoxW(None, "Hello Hak5!", 'Info', 0x10 | 0x1)