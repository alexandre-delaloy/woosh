#!/bin/bash

function SYNC () {
    # for every file in this repository,
    for i in "$(pwd)"/.*
    do
        # return the same file in the home directory
        FILE=$HOME/$(basename "$i")
        # if this file don't exist and if its not specific file,
        if [[ ! -f "$FILE" 
            && "$FILE" != "$HOME/.git"
            && "$FILE" != "$HOME/."
            && "$FILE" != "$HOME/.." ]]; then
            # create the file
            echo -e "$FILE \e[38;5;196m not found \e[38;5;15m"
            touch "$FILE" ; echo -e "$FILE \e[38;5;47m created ! \e[38;5;15m"
        fi
    done
    # sync all files from this repo to my computer, excluding specific files
    rsync --exclude "bin" \
        --exclude "scripts" \
        --exclude ".git" \
        --exclude ".zshrc" \
        --exclude "install.sh" \
        --exclude "LICENSE" \
        --exclude "README.md" \
        --exclude "update.sh" \
        -avh --no-perms . ~;
    # shellcheck disable=SC1091
    . ~;
}