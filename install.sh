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
for config_dir in .config/*
do
    rm -rf "$HOME/$config_dir"
    ln -sf "$dir/$config_dir" \
        "$HOME/$config_dir"
done

symlink_items=".Xresources .bashrc .gtkrc-2.0"
for item in $symlink_items
do
    ln -sf "$dir/$item" "$HOME/$item"
done

nvim -c :PluginInstall -c :qa!

