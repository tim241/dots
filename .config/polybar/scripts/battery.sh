#!/usr/bin/env bash
set -e

if ! info="$(acpi 2> /dev/null)"
then
    echo 100%
    exit
fi

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
