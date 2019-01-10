#!/usr/bin/env bash
set -e

info="$(acpi 2> /dev/null)"

if [ ! "$info" ]
then
    echo 100%
    exit
fi

battery_status="$(awk '{print $3}' <<< "$info")"
battery_amount="$(awk '{print $4}' <<< "$info")"
# strip strings
battery_status="${battery_status//,}"
battery_amount="${battery_amount//%,}"

# print
echo "$battery_amount%"
