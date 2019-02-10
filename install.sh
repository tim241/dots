#!/usr/bin/env bash
#
# Please note
# This script isn't perfect
# So don't whine about shellcheck complaining
# Thank you for reading and understanding
#
set -e

[ ! "$HOME"    ] && exit 1
[ ! -d "$HOME" ] && exit 1

[ ! -d "$HOME/.config" ] && mkdir "$HOME/.config"
[ ! -d "$HOME/.themes" ] && mkdir "$HOME/.themes"

for pkg_man in pacman apt-get xbps-install
do
    if command -v "$pkg_man" > /dev/null 2>&1
    then
        bash ".scripts/install/${pkg_man}.sh"
        break
    fi
done

# Create required directories
mkdir -p "$HOME/.local/share"


block_symlink_dirs=(
                    '.config/weechat'
                    '.mozilla'
                    'bin'
                    )

dir="$(pwd)"
for config_dir in .config/* .themes .icons .local/share/bash \
    .mozilla bin
do
    blocked=false
    for blacklist_dir in "${block_symlink_dirs[@]}"
    do
        if [ "$config_dir" = "$blacklist_dir" ]
        then
            blocked=true
        fi
    done

    if [ "$blocked" = "false" ]
    then
        rm -rf "$HOME/$config_dir"
        ln -sf "$dir/$config_dir" \
            "$HOME/$config_dir"
    elif [ ! -d "$HOME/$config_dir" ]
    then
        cp -r "$dir/$config_dir" \
            "$HOME/$config_dir"
    fi
done

symlink_items=(
               '.bashrc'
               '.gtkrc-2.0'
               '.xinitrc'
               )

for item in "${symlink_items[@]}"
do
    ln -sf "$dir/$item" "$HOME/$item"
done

# Prepare nvim
plug_file="$HOME/.local/share/nvim/site/autoload/plug.vim"

if [ ! -f "$plug_file" ]
then
    curl -fLo "$plug_file" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

nvim -c :PlugInstall -c :qa!

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

