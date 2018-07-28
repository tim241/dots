#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# <-- PS1 stuff -->
#
PS1='[\u@\h \W]\$ '


# <-- alias stuff -->
#
alias ls='ls --color=auto'


# <-- XDG stuff -->
#
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
# Import user-dirs.dirs
while read -r line
do
    export "$line"
done < "$XDG_CONFIG_HOME/user-dirs.dirs" 2> /dev/null


# <-- gruvbox stuff -->
#
gruvbox_pallet="$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"
if [ -f "$gruvbox_pallet" ]
then
    source "$gruvbox_pallet"
fi


# <-- text editor stuff -->
#
export VISUAL=nvim
export EDITOR="$VISUAL"

