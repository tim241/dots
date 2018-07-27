#!/usr/bin/env bash
#
# Please note
# This script isn't perfect
# So don't whine about shellcheck complaining
# Thank you for reading and understanding
#
set -e
git submodule update --init

dir="$(pwd)"
for config_dir in bspwm sxhkd gtk-3.0
do
    rm -rf "$HOME/.config/$config_dir"
    ln -sf "$dir/.config/$config_dir" \
        "$HOME/.config/$config_dir"
done

rm -rf "$HOME/.vim"

symlink_items=".Xresources .bashrc .vimrc .gtkrc-2.0 .vim"
for item in $symlink_items
do
    ln -sf "$dir/$item" "$HOME/$item"
done

yes | vim -c :PluginInstall -c :qa!

