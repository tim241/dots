#!/usr/bin/env bash
#
# Please note
# This script isn't perfect
# So don't whine about shellcheck complaining
# Thank you for reading and understanding
#
set -e

git submodule update --init

[ ! "$HOME"    ] && exit 1
[ ! -d "$HOME" ] && exit 1

[ ! -d "$HOME/.config" ] && mkdir "$HOME/.config"
[ ! -d "$HOME/.themes" ] && mkdir "$HOME/.themes"

for pkg_man in pacman
do
    if command -v "$pkg_man" > /dev/null 2>&1
    then
        bash ".install/${pkg_man}.sh"
        break
    fi
done

dir="$(pwd)"
for config_dir in .config/* .themes
do
    rm -rf "$HOME/$config_dir"
    ln -sf "$dir/$config_dir" \
        "$HOME/$config_dir"
done

symlink_items=(
               '.Xresources'
               '.bashrc'
               '.gtkrc-2.0'
               '.xinitrc'
               )

for item in "${symlink_items[@]}"
do
    ln -sf "$dir/$item" "$HOME/$item"
done

if [ ! -d "$HOME/.mozilla" ]
then
    cp -r "$dir/.mozilla" "$HOME/.mozilla"
fi

nvim -c :PluginInstall -c :qa!

# Create directories
for dir in dev media/vids media/pics media/music \
    media/docs media/public media/templates .desktop dls
do
    dir="$HOME/$dir"
    if [ ! -d "$dir" ]
    then
        mkdir -p "$dir"
    fi
done

