#!/usr/bin/env bash
set -e
for package in bspwm sxhkd rxvt-unicode xorg \
                pulseaudio redshift \
                firefox weechat neovim \
                rofi dunst fira xdg-utils \
                bash-completion \
                autocutsel w3m neomutt \
                offlineimap scrot xclip unclutter \
                polybar
do
    if ! pkg info "$package" &> /dev/null
    then
        install_pkgs+=("$package")
    fi

done
if [ "$install_pkgs" ]
then
    if command -v sudo &> /dev/null
    then
        sudo pkg install --yes "${install_pkgs[@]}"
    else
        doas pkg install --yes "${install_pkgs[@]}"
    fi
fi


