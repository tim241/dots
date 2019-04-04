#!/usr/bin/env bash
set -e
if [ -f /bedrock/etc/os-release ]
then
    source /bedrock/etc/os-release
else
    if [ -f /etc/os-release ]
    then
        source /etc/os-release
    else
        NAME="$(uname)"
    fi
fi

if [ "$NAME" ]
then
    echo "$NAME"
fi

