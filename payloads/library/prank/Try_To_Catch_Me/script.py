try:
    import tkinter as tk  # Import the tkinter module as tk for creating GUI
    import tkinter.ttk as ttk  # Import the ttk module from tkinter for themed widgets
    import random  # Import the random module for generating random numbers
    import pyttsx3  # Import the pyttsx3 module for text-to-speech synthesis
except ImportError:
    import subprocess  # Import the subprocess module for executing system commands
    import sys  # Import the sys module for system-specific parameters and functions

    def install_package(package):
        # Function to install a Python package using pip
        subprocess.check_call([sys.executable, "-m", "pip", "install", package])

    try:
        import tkinter as tk  # Import tkinter module as tk
        import tkinter.ttk as ttk  # Import ttk module from tkinter
        import random  # Import random module
        import pyttsx3  # Import pyttsx3 module
    except ImportError:
        install_package("tkinter")  # Install tkinter package if import fails
        install_package("pyttsx3")  # Install pyttsx3 package if import fails
        import tkinter as tk  # Import tkinter module as tk
        import tkinter.ttk as ttk  # Import ttk module from tkinter
        import random  # Import random module
        import pyttsx3  # Import pyttsx3 module


# Define a list of strings for popup messages
testi = ["Catch me!", "I'm here!", "Where are you clicking?", "Ooooh, come on!", "It's too easy!"]

motore = pyttsx3.init()  # Initialize the pyttsx3 engine for text-to-speech synthesis

# Define a class for the popup window
class Popup:

    def __init__(self, master):
        self.master = master  # Assign the master (root) window to the popup window
        self.popup = tk.Toplevel(master)  # Create a new top-level window
        self.popup.title("Try to catch me!")  # Set the title of the popup window

        # Set the protocol for handling the window close event
        self.popup.protocol("WM_DELETE_WINDOW", self.close_popup)

        # Create a label widget for the message in the popup window
        message_label = ttk.Label(self.popup, text="Try to catch me!", font=("Helvetica", 18, "bold"), foreground="white", background="black")
        message_label.pack(pady=20)  # Add the label to the window and set the padding

        # Create a button widget for closing the popup window
        self.close_button = ttk.Button(self.popup, text="Catch!", command=self.close_popup)
        self.close_button.pack(pady=10)  # Add the button to the window and set the padding

        # Create a ttk.Style object for configuring the popup window's appearance
        self.popup.style = ttk.Style(self.popup)
        # Configure a custom style for the frame widget in the popup window
        self.popup.style.configure("Popup.TFrame", background="black")
        # Configure the style for the button widget in the popup window
        self.popup.style.configure("TButton", background="white", font=("Helvetica", 14))
        # Configure the style for the label widget in the popup window
        self.popup.style.configure("TLabel", foreground="white", background="black", font=("Helvetica", 14))

        # Create a frame widget with the custom style in the popup window
        self.popup_frame = ttk.Frame(self.popup, style="Popup.TFrame", width=200)
        self.popup_frame.pack_propagate(0)  # Prevent the frame from resizing
        self.popup_frame.pack()  # Add the frame to the popup window

        self.x = random.randint(0, master.winfo_screenwidth() - 200)
        self.y = random.randint(0, master.winfo_screenheight() - 100)
        # Set the position of the popup window randomly on the screen
        self.popup.geometry("+{}+{}".format(self.x, self.y))

    def close_popup(self):
        self.popup.destroy()  # Destroy the popup window
        Popup(self.master)  # Create a new instance of the Popup class

        rate = motore.getProperty('rate')  # Get the current speech rate
        motore.setProperty('rate', rate)  # Set the speech rate

        motore.say(testi[random.randint(0, len(testi)-1)])  # Generate a random index and speak a random message from the list
        motore.runAndWait()  # Run the text-to-speech synthesis engine

root = tk.Tk()  # Create the root window
root.withdraw()  # Hide the root window

popup = Popup(root)  # Create an instance of the Popup class with the root window

root.mainloop()  # Start the main event loop of the tkinter application
