#!/usr/bin/env bash
tim241_dir="${XDG_CONFIG_HOME:-$HOME/.config}/bspwm"
scripts="$tim241_dir/scripts"
tim241_bin="$tim241_dir/bin"

# Start urxvt daemon
#
urxvtd &


# Make sure pulseaudio is running
#
if ! pulseaudio --check
then
    if command -v systemctl &> /dev/null
    then
        systemctl --user start pulseaudio
    else
        pulseaudio --start
    fi
fi

# This helps to not kill ur eyes
#
redshift &

# Notification daemon
#
dunst &

# Get variables from Xresources
#
xrdb "$tim241_dir/gruvbox-dark-soft/Xsettings" &

# Set background
#
"$tim241_dir/gruvbox-dark-soft/wallpaper.sh" &

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
    mpd --no-config --no-daemon
fi
) &

# Check for dotfiles update
#
dots_dir="$(readlink "$XDG_CONFIG_HOME/bspwm")/../../"
update_file="$dots_dir/.scripts/checkupdate.sh"
if [ -f "$update_file" ]
then
    sleep 5
    bash "$update_file" "$dots_dir"
fi &

