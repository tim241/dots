#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# XDG stuff
#
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
# Import user-dirs.dirs
while read -r line
do
    export "$line"
done < "$XDG_CONFIG_HOME/user-dirs.dirs" 2> /dev/null

# Make sure gruvbox has the correct color pallet
gruvbox_pallet="$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"
if [ -f "$gruvbox_pallet" ]
then
    source "$gruvbox_pallet"
fi

# Make vim the standard editor
export VISUAL=nvim
export EDITOR="$VISUAL"

