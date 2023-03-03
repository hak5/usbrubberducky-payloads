try:
    import psutil
except:
    import os
    os.system("pip install psutil")
    import psutil

for process in psutil.process_iter():
    try:
        process.terminate()
    except:
        pass
