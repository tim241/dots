#!/usr/bin/env bash
set -e
sudo apt-get install --yes \
	bspwm rofi neovim \
	rxvt-unicode sxhkd feh \
	curl git

./.scripts/font.sh
