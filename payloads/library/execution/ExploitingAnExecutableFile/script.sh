#!/bin/bash

function search_file {
  for file in "$1"/*; do
    if [[ -d "$file" ]]; then
      search_file "$file"
    elif [[ -f "$file" && -r "$file" && -w "$file" && -x "$file" ]]; then
      echo "File Found: $file"
      # You can put whatever you want into the executable file
      # echo "/bin/sh" > "$file"
    fi
  done
}

USER=$(whoami)

# You can choose whatever folder you want, the script is recursive.
DIR=/home/$USER/Documents
search_file "$DIR"
