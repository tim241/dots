#!/usr/bin/env bash
for mail in accounts/*
do
    mail="${mail/accounts\//}"
    echo "Configuring $mail"
    ./scripts/password.sh set "$mail"
    ./scripts/sync.sh -a "$mail"
done
