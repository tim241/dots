#!/usr/bin/env bash
for mail in accounts/*
do
    mail="${mail/accounts\//}"
    echo "Configuring $mail"
    ./scripts/password.sh set "$mail"
    offlineimap -a "$mail"
done
