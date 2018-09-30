#!/usr/bin/env bash
set -e

while true
do
    info="$(acpi)"
    battery_status="$(awk '{print $3}' <<< "$info")"
    battery_amount="$(awk '{print $4}' <<< "$info")"
    # strip strings
    battery_status="${battery_status//,}"
    battery_amount="${battery_amount//%,}"
    
    if (($battery_amount < 10)) && \
        [ "$battery_status" != "Charging" ]
    then
        notify-send "[battery]" "$battery_amount%"
    fi

    sleep 60
done

