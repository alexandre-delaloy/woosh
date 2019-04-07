#!/bin/bash

function SYNC () {
    # for every file in my dotfiles repository
    for i in "$(pwd)"/.*
    do
        # return the same file in the home directory
        FILE=$HOME/$(basename "$i")
        # if this file not exist or if its not a git file,
        if [[ ! -f "$FILE" && "$FILE" != "$HOME/.git" ]]; then
            # create the file
            echo "$FILE not found !" && touch "$FILE"
        fi
    done
    # sync all files in my dotfiles repository, excluding specific files
    rsync --exclude ".git" \
        --exclude ".zshrc" \
        --exclude "LICENSE" \
        --exclude "README.md" \
        --exclude "bin" \
        --exclude "scripts" \
        --exclude "install.sh" \
        --exclude "update.sh" \
        -avh --no-perms . ~;
    . ~;

    for i in /usr/local/bin/.*
    do
        echo "$i"
    done
}