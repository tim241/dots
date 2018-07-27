#!/usr/bin/env bash
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
ln -sf "$dir/.vim"       "$HOME/.vim"

ln -sf "$dir/.vimrc"     "$HOME/.vimrc"
ln -sf "$dir/.gtkrc-2.0" "$HOME/.gtkrc-2.0"

yes | vim -c :PluginInstall -c :qa!

