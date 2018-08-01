#!/usr/bin/env bash

if [ ! "$HOME" ] || \
    [ ! -d "$HOME" ]
then
    echo "\$HOME is invalid"
    exit 1
fi

if [ ! "$XDG_CACHE_HOME" ]
then
    XDG_CACHE_HOME="$HOME/.cache"
fi

if [ ! -d "$XDG_CACHE_HOME" ]
then
    mkdir -p "$XDG_CACHE_HOME"
fi

logfile="$XDG_CACHE_HOME/xorg.log"

if [ -f "$logfile" ]
then
    mv "$logfile" "$logfile.old"
fi

exec bspwm > "$logfile" 2>&1
