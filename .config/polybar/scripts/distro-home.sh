#!/usr/bin/env bash
set -e
if [ -f /bedrock/etc/os-release ]
then
    source /bedrock/etc/os-release
else
    source /etc/os-release
fi

if [ "$HOME_URL" ]
then
    xdg-open "$HOME_URL"
fi

