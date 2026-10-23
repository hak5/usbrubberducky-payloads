#!/bin/bash
#
# TESTED ON
# Debian-Based Linux Distributions
#
# USAGE
# $ "${BASH}" ./decode.sh <TIMESTAMPS_FILE>
# $ "${BASH}" ./decode.sh ./timestamps.log
#

set -eo pipefail

readonly TIMESTAMPS_FILE="${1}"

set -u

if [ -f "${TIMESTAMPS_FILE}" ]; then
    mapfile -t timestamps < "${TIMESTAMPS_FILE}"

    hms_d() {
        printf "%d" "$(( 10#"${1}" ))"
    }

    previous_seconds=()
    for timestamp in "${timestamps[@]}"; do
        timestamp_hours="$(hms_d "$(date --date="@${timestamp}" +"%H")")"
        timestamp_minutes="$(hms_d "$(date --date="@${timestamp}" +"%M")")"
        timestamp_seconds="$(hms_d "$(date --date="@${timestamp}" +"%S")")"
        computed_seconds="$(( (timestamp_hours * 3600) + (timestamp_minutes * 60) + timestamp_seconds ))"
    
        if [ "${#previous_seconds[@]}" -eq 0 ]; then
            previous_seconds[0]="${computed_seconds}"
        else
            printf "%b" "$(printf '\\u%04x' "$(( computed_seconds - previous_seconds[0] ))")"
            previous_seconds[0]="${computed_seconds}"
        fi
    done
    echo ""
fi
