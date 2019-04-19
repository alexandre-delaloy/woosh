#!/bin/bash
# shellcheck disable=SC1091
# shellcheck disable=SC2181

function SYNC () {
    # for every file in this repository,
    for i in "$(pwd)"/.*
    do
        # return the same file in the home directory
        BASEI=$(basename "$i")
        FILE=$HOME/$BASEI
        # if this file don't exist and if its not specific file,
        if [[ ! -f "$FILE" 
            && "$FILE" != "$HOME/.git"
            && "$FILE" != "$HOME/."
            && "$FILE" != "$HOME/.." ]]; then
            # echo that the file isn't founded
            echo -e "$BASEI \e[38;5;1m=> not found \e[38;5;15m"
            # create the file
            touch "$FILE" ; echo -e "$FILE \e[38;5;2m=> created \e[38;5;15m"
        else 
            # echo taht the file exist
            echo -e "$BASEI \e[38;5;3m=> found \e[38;5;15m"
        fi
    done ; sleep 1
    # sync all files from this repo to my computer, excluding specific files
    rsync --exclude "bin/" \
        --exclude "scripts/" \
        --exclude ".git/" \
        --exclude ".git" \
        --exclude ".zshrc" \
        --exclude "install.sh" \
        --exclude "LICENSE" \
        --exclude "README.md" \
        --exclude "update.sh" \
        -avh --no-perms . ~;
    . ~;
}

function UPDATE () {
    if [[ "$1" == "-f" || "$1" == "--force" ]] ; then SYNC ;
    else
        clear ; read -r -p "Overwrite existing files ? (y/n) " -n 1 ;
        if [ $? -eq 0 ]; then clear
            if [[ $REPLY =~ ^[Yy]$ ]] ; then SYNC ;
            elif [[ $REPLY =~ ^[Nn]$ ]] ; then echo "Execution stopped"
            else echo -e "\e[38;5;1m$REPLY \e[38;5;15misn't an available value !" ; fi 
        else
            RETURNED=""
            clear ; vared -p "Overwrite existing files ? (y/n) " -c RETURNED ; echo ; clear
            if [[ $RETURNED == "Y" ||  $RETURNED == "y" ]] ; then SYNC ;
            elif [[ $RETURNED == "N" ||  $RETURNED == "n" ]] ; then echo "Execution stopped"
            else echo -e "\e[38;5;1m$RETURNED \e[38;5;15misn't an available value !" ; fi 
        fi
    fi
}