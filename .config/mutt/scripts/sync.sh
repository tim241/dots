#!/usr/bin/env bash
data_dir="${XDG_DATA_HOME:-$HOME/.local/share}/offlineimap"
config_dir="${XDG_CONFIG_HOME:-$HOME/.config}/offlineimap"

if [ ! -d "$data_dir" ]
then
    mkdir -p "$data_dir"
fi

if [ -f "$config_dir/config" ]
then
    ln -sf "$config_dir/config" "$HOME/.offlineimaprc"
    ln -sf "$data_dir" "$HOME/.offlineimap"
fi

offlineimap $@

rm -f "$HOME/.offlineimaprc" "$HOME/.offlineimap"
