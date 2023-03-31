#!/bin/bash

# Create a random directory
dir_name=$(mktemp -d)

# Delete the directory after 60 minutes (3600 seconds)
(sleep 3600 && rm -rf $dir_name) &

# Move into the directory
cd $dir_name

# Downloa the zip from your own link
curl -LOk "https://www.example.com/file.zip"

# Unzip it
unzip file.zip

# Open the login page
xdg-open login.html; exit;