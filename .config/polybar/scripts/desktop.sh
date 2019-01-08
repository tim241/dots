#!/usr/bin/env bash
set -e

# First off, echo 0
echo 0

bspc subscribe desktop | while read -r msg
do
    # output:
    # desktop_focus [previous] [current]
    #
    # get [current]
    msg="$(echo "$msg" | awk '{print $3}' )"

    bspc query --desktops -d "$msg" --names
done
