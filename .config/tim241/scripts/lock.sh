#!/usr/bin/env bash
if ! command -v i3lock &> /dev/null
then
    notify-send "[lock] install i3lock[-color]]"
    exit 1
fi

config_dir="${XDG_CONFIG_HOME:-$HOME/.config}/tim241"

if [ "$(man i3lock | grep i3lock-color)" ]
then
    "$config_dir/bin/betterlockscreen" -l > /dev/null
else
    i3lock -c '#32302f'
fi

