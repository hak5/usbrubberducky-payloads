import binascii

def convert_to_hex(filename, output_file):
    with open(filename, 'rb') as file:
        binary_data = file.read()

    hex_code = binascii.hexlify(binary_data).decode()

    with open(output_file, 'w') as output:
        output.write(hex_code)

# Esempio di utilizzo
exe_filename = 'C:/Users/Aleff/Documents/GitHub/tmp/TODO Install_And_Run_Any_Arbitrary_Executable-No_Internet_Needed/assets/dist/example.exe'
output_filename = 'C:/Users/Aleff/Documents/GitHub/tmp/TODO Install_And_Run_Any_Arbitrary_Executable-No_Internet_Needed/assets/example.txt'
convert_to_hex(exe_filename, output_filename)
