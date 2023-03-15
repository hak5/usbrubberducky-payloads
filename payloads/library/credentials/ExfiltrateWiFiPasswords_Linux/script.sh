#!/bin/bash

for conn in $(nmcli connection show | grep wifi | awk '{print $1}'); do
    nmcli connection show $conn >> "$TMP_FOLDER_PATH/output_verbose.txt" -
    nmcli connection show $conn | grep psk >> "$TMP_FOLDER_PATH/output.txt" -
done
