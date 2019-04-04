#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#
# <-- bash settings -->
#

# enable vi mode when we're not in tty
if [ "$TERM" != "linux" ]
then
    bind -f ~/.local/share/bash/vi-mode
fi

#
# <-- source stuff -->
#

source ~/.local/share/bash/git-prompt.sh

#
# <-- PS1 stuff -->
#

PS1='> \W$(__git_ps1) '

#
# <-- variable stuff -->
#

# dotnet core stuff
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1

# add $HOME/bin to PATH
export PATH="$PATH:$HOME/bin"

# use nvim for manpages
export MANPAGER='nvim +Man!'

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

# set weechat dir to $XDG_CONFIG_HOME/weechat
export WEECHAT_HOME="$XDG_CONFIG_HOME/weechat"

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
if [ "$(tty)" = "/dev/tty1" ] || \
    [ "$(tty)" = "/dev/ttyv0" ] &&
    [ -f "$HOME/.xinitrc" ] && \
    command -v startx &> /dev/null
then
    exec startx
fi

