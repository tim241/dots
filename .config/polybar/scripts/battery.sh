#!/usr/bin/env bash
set -e

info="$(acpi)"
battery_status="$(awk '{print $3}' <<< "$info")"
battery_amount="$(awk '{print $4}' <<< "$info")"
# strip strings
battery_status="${battery_status//,}"
battery_amount="${battery_amount//%,}"

# print
echo "$battery_amount%"
