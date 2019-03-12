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

source /etc/os-release

case "$NAME" in
    "void")
        set_wall "$wall_dir/void.png";;
    "Arch Linux")
        set_wall "$wall_dir/arch.png";;
esac
