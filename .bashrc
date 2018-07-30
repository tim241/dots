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

# dotnet core stuff
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1

# include $HOME/bin to PATH
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
# easy access to text editor
alias v="$VISUAL"

#
# <-- XDG stuff -->
#

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
# Import user-dirs.dirs
xdg_dir_file="$XDG_CONFIG_HOME/user-dirs.dirs"
if [ -f "$xdg_dir_file" ]
then
    source "$xdg_dir_file" 2> /dev/null
fi

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

