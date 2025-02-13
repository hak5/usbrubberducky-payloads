echo '#!/bin/bash' > .randomize_user_agent

echo 'UA=$(torify curl "https://user-agents.net/random" -H "content-type: application/x-www-form-urlencoded" -H "referer: https://user-agents.net/random" --data-raw "limit=1&action=generate")' >> .randomize_user_agent

echo 're="<li><a href=\".+\">(.+)<\/a><\/li>"' >> .randomize_user_agent

echo 'if [[ $UA =~ $re ]]; then
    /usr/bin/google-chrome-stable --user-agent="${BASH_REMATCH[1]}"
else
    /usr/bin/google-chrome-stable
fi' >> .randomize_user_agent

sudo chmod +x .randomize_user_agent

NEW_STRING="/home/$(whoami)/.randomize_user_agent"

awk -v new="$NEW_STRING" '{gsub("/usr/bin/google-chrome-stable", new)}1' /usr/share/applications/google-chrome.desktop > tmp

sudo tee /usr/share/applications/google-chrome.desktop < tmp

gtk-update-icon-cache

