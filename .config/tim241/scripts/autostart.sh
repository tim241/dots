#!/usr/bin/env bash
tim241_dir="${XDG_CONFIG_HOME:-$HOME/.config}/tim241"
tim241_scripts="$tim241_dir/scripts"
tim241_bin="$tim241_dir/bin"

theme="$("$tim241_bin/theme" get)"

# Start urxvt daemon
#
urxvtd &


# Make sure pulseaudio is running
#
pulseaudio --start

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

# Change cursor
#
xsetroot -cursor_name left_ptr &

# Hide cursor
#
unclutter -idle 1 -root &

# Stop screen tearing
#
compton --vsync-aggressive &

# Battery notifier
#
"$tim241_scripts/battery.sh" &

# Bar
#
polybar gruvbox &

# Mpd daemon
#
(
if ! pgrep mpd
then
    mpd &
fi
) &

# Check for dotfiles update
#
dots_dir="$(readlink "$XDG_CONFIG_HOME/tim241")/../../"
update_file="$dots_dir/.scripts/checkupdate.sh"
if [ -f "$update_file" ]
then
    sleep 5
    bash "$update_file" "$dots_dir"
fi &

