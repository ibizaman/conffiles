#!/usr/bin/env bash

cd $HOME/.password-store || exit 1

# Didn't use $(pass ls) here as I need the password with leading folder
account=$(find . -mindepth 1 -name '*.gpg' -type f -printf '%P\n' \
    | sed -e 's/.gpg$//' \
    | sort \
    | rofi -no-custom -dmenu -i -p 'Copy password into clipboard for 45 seconds:')

if ! [ -z "$account" ]; then
    pass show --clip "$account"
fi
