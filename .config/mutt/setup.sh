#!/usr/bin/env bash
for mail in accounts/*
do
    mail="${mail/accounts\//}"
    echo "Configuring $mail"
    ./scripts/passwd set "$mail"
done
