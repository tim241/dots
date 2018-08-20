#!/usr/bin/env bash
set -e

if [ -d "$1" ]
then
    cd "$1"
fi

git fetch > /dev/null

if [ "$(git log HEAD..origin/master --oneline)" ]
then
    notify-send -t 10000 "[dots] update available"
fi
