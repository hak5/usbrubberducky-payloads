#!/bin/bash

while true; do
	response=$(curl -k -H "Authorization: 0ff4fbf0ecffa77ce8d3852a29263e263838e9bb" -X POST https://systemip/webui/logoutconfirm.html?logon_hash=1)
	
	if [[ $response =~ ^[0-9a-zA-Z]+$ ]]; then
		if [ $? -eq 0]; then
			# Attack detected, here you decide what to do in this moment
			# 1. Send an email to sec-team
			# TODO
			# 2. Do some other ops like save some log information somewhere or save before stop the process
			# ...
			# 3. What do you want to do?
			#    Can you reboot the system or you need to do something else before?
			#    Do you want to close it?
			# ...
			
			# The only one way to close the backdoor is reboot the system, so don t change it (?)...
			# |-> See the Conseguence section in README
			reboot
		else
			# You are safe :-)
		fi
	fi
	sleep 300 # wait time
done
