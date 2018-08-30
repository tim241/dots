#!/usr/bin/env bash
set -e
for package in bspwm sxhkd rxvt-unicode kitty \
                xorg-server xorg-xsetroot xorg-xinit feh \
                pulseaudio pulseaudio-alsa \
                redshift firefox weechat \
                neovim rofi dunst \
                otf-fira-mono \
                xdg-utils xdg-user-dirs \
                bash-completion \
                autocutsel \
                w3m neomutt offlineimap \
                acpi \
                scrot xclip unclutter
do
    if ! pacman -Qi "$package" &> /dev/null
    then
        install_pkgs+=("$package")
    fi

done
if [ "$install_pkgs" ]
then
    sudo pacman -S --needed --noconfirm "${install_pkgs[@]}"
fi

