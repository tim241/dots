#!/usr/bin/env bash
function set_wall()
{
    feh --bg-fill "$@"
    exit
}

config_dir="${XDG_CONFIG_HOME:-$HOME/.config}"
wall_dir="$config_dir/tim241/themes/gruvbox-soft/walls/"

xsetroot -solid '#32302f'

if [ -f "/bedrock/etc/os-release" ]
then
    set_wall "$wall_dir/brl.png"
fi

source /etc/os-release

if [ "$NAME" = "void" ]
then
    set_wall "$wall_dir/void.png"
fi
