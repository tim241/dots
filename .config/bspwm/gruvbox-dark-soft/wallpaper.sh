#!/usr/bin/env bash
function set_wall()
{
    wallpaper="$@"
    echo "wallpaper: $wallpaper"
    feh --bg-fill "$wallpaper"
    exit
}

config_dir="${XDG_CONFIG_HOME:-$HOME/.config}"
wall_dir="$config_dir/bspwm/gruvbox-dark-soft/walls"

xsetroot -solid '#32302f'

if [ -f "/bedrock/etc/os-release" ]
then
    set_wall "$wall_dir/brl.png"
fi

if [ -f /etc/os-release ]
then
    source /etc/os-release 2> /dev/null
else
    NAME="$(uname)"
fi

case "$NAME" in
    "void")
        set_wall "$wall_dir/void.png";;
    "Arch Linux")
        set_wall "$wall_dir/arch.png";;
    "FreeBSD")
        set_wall "$wall_dir/FreeBSD.png";;
esac
