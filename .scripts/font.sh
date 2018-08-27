#!/usr/bin/env bash
set -e
font_dir="$HOME/.local/share/fonts"

if [ -d "$font_dir/fira" ]
then
    exit
fi

if [ ! -d "$font_dir" ]
then
    mkdir -p "$font_dir"
fi

git clone https://github.com/mozilla/Fira "$font_dir" --depth=1
