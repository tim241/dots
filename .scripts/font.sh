#!/usr/bin/env bash
set -e
font_dir="$HOME/.local/share/fonts"

if [ -d "$font_dir/Fira" ]
then
    exit
fi

if [ ! -d "$font_dir" ]
then
    mkdir -p "$font_dir"
fi

git clone https://github.com/mozilla/Fira "$font_dir/Fira" --depth=1

fc-cache -f
