#!/usr/bin/env bash
set -e
for package in bspwm sxhkd rxvt-unicode \
                xorg-server xorg-xsetroot xorg-xinit \
                pulseaudio pulseaudio-alsa \
                redshift firefox \
                neovim dmenu dunst \
                otf-fira-mono \
                xdg-utils xdg-user-dirs \
                bash-completion \
                autocutsel
do
    if ! pacman -Qi $package > /dev/null 2>&1
    then
        install_pkgs+=("$package")
    fi

done
if [ "$install_pkgs" ]
then
    sudo pacman -S --needed --noconfirm "${install_pkgs[@]}"
fi

