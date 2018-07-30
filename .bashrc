#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#
# <-- PS1 stuff -->
#

PS1='[\u@\h \W]\$ '

#
# <-- variable stuff -->
#

export DOTNET_CLI_TELEMETRY_OPTOUT=1

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
# easy access to text editor
alias v="$VISUAL"

#
# <-- XDG stuff -->
#

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
# Import user-dirs.dirs
while read -r line
do
    export "$line"
done < "$XDG_CONFIG_HOME/user-dirs.dirs" 2> /dev/null

#
# <-- gruvbox stuff -->
#

gruvbox_pallet="$HOME/.config/nvim/plugins/gruvbox/gruvbox_256palette.sh"
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

