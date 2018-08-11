#!/usr/bin/env bash
set -e

dir="$HOME/.local/share/mutt/mail"

[ ! -d "$dir" ] && mkdir -p "$dir"

function getPasswd() {
    file="$dir/$1.gpg"
    if [ ! -f "$file" ]
    then
        echo
        exit
    fi

    gpg --decrypt --quiet "$file"
    exit
}

function setPasswd() {
    mail="$1"
    file="$dir/$mail.gpg"
    if [ -f "$file" ]
    then
        echo "already exists"
        exit 1
    fi
    
    printf "password: "
    read -rs password
    echo
    echo "$password" | gpg --encrypt -r "$mail" \
        > "$file"
    unset password
}

function usage() {
    printf "%s\n%s\n%s\n" \
        "$0 get [mail]" \
        "$0 set [mail]" \
        "$0 usage"
}

case $1 in
    get) getPasswd "$2";;
    set) setPasswd "$2";;
    *) usage;;
esac
