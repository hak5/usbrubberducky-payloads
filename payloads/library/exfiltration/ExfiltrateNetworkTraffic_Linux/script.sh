#!/bin/bash

filter_expression="tcp port 80"

net_card="$(ip route get 8.8.8.8 | awk '{ print $5; exit }')"

tcpdump -i "$net_card" $filter_expression -w packets.pcap &
tcpdump_pid=$!

sleep 60

kill $tcpdump_pid