#!/usr/bin/env bash
tim241_dir="${XDG_CONFIG_HOME:-$HOME/.config}/tim241"
tim241_bin="$tim241_dir/bin"

theme="$("$tim241_bin/theme" get)"

# This helps to not kill ur eyes
#
redshift &

# Notification daemon
#
dunst &

# Get variables from Xresources
#
xrdb "$tim241_dir/themes/$theme/Xsettings" &

# Set background
#
"$tim241_dir/themes/$theme/wallpaper.sh"

# Clipboard manager
#
autocutsel -fork &
autocutsel -fork -selection PRIMARY &

# Battery notifier
#
"$tim241_bin/battery" &

# Check for dotfiles update
#
dots_dir="$(readlink "$XDG_CONFIG_HOME/tim241")/../../"
update_file="$dots_dir/.scripts/checkupdate.sh"
if [ -f "$update_file" ]
then
    sleep 5
    bash "$update_file" "$dots_dir"
fi &

