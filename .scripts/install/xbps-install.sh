#!/usr/bin/env bash
set -e
for package in bspwm sxhkd rxvt-unicode \
                xorg xinit xsetroot feh \
                pulseaudio \
                redshift firefox weechat \
                neovim rofi dunst \
                font-fira-otf \
                xdg-utils xdg-user-dirs \
                bash-completion \
                autocutsel \
                w3m neomutt offlineimap \
                acpi \
                scrot xclip unclutter pulsemixer \
                polybar \
                curl
do
    if ! xbps-query "$package" &> /dev/null
    then
        install_pkgs+=("$package")
    fi
done
if [ "$install_pkgs" ]
then
    sudo xbps-install -S --yes "${install_pkgs[@]}"
fi
