#!/bin/bash

function SYNC_DOTFILES () {
    # get the last version of my repository
    git pull origin master

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
        --exclude "README.md" \
        --exclude "install.sh" \
        --exclude "scripts" \
        -avh --no-perms . ~;
    source ~ ;
}
function INSTALL_BREW_STUFF() {
    
    # install brew
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    # be sure this is the latest version
    brew update

    # upgrade any already-installed formulae.
    brew upgrade

    # install all given brew formulae
    for i in "${BREW_APPS[@]}" ; do brew install "$i" ; done

    # install all given brew casks
    for i in "${BREW_APPS_CASK[@]}" ; do brew cask install "$i" ; done

    # remove outdated versions
    brew cleanup

    # diagnosis formulae
    brew doctor
}


SYNC_DOTFILES

# INSTALL_BREW_STUFF
