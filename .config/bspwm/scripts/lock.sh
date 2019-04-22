#!/usr/bin/env bash
if ! command -v i3lock &> /dev/null
then
    notify-send "[lock] install i3lock[-color]]"
    exit 1
fi

config_dir="${XDG_CONFIG_HOME:-$HOME/.config}/bspwm"

mpc_continue=no
if mpc pause-if-playing &> /dev/null
then
    mpc_continue=yes
fi

if [ "$(man i3lock | grep i3lock-color)" ]
then
    "$config_dir/bin/betterlockscreen" -l > /dev/null
else
    i3lock -c '#32302f'
fi

if [ "$mpc_continue" = "yes" ]
then
    mpc play
fi
