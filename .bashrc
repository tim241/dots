#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#
# <-- source stuff -->
#

source ~/.local/share/bash/git-prompt.sh

#
# <-- PS1 stuff -->
#

PS1='» \W$(__git_ps1) '

#
# <-- variable stuff -->
#

# dotnet core stuff
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1

# add $HOME/bin to PATH
export PATH="$PATH:$HOME/bin"

#
# <-- text editor stuff -->
#

export VISUAL=nvim
export EDITOR="$VISUAL"

#
# <-- alias stuff -->
#

# enable colors for ls
alias ls='ls --color=auto'
# easy fix for common mistake
alias sl='ls'
# quick way to list everything
alias ll='ls -la'
# easy access to text editor
alias v="$VISUAL"
# easy access to mail
alias m='neomutt'

#
# <-- XDG stuff -->
#

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

#
# <-- gruvbox stuff -->
#

gruvbox_pallet="$HOME/.local/share/nvim/plugged/gruvbox/gruvbox_256palette.sh"
if [ -f "$gruvbox_pallet" ]
then
    source "$gruvbox_pallet"
fi

#
# <-- autostart stuff -->
#

# autostart X
if [ "$(tty)" = "/dev/tty1" ] && \
    [ -f "$HOME/.xinitrc" ] && \
    command -v startx > /dev/null 2>&1
then
    exec startx
fi

