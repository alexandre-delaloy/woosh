#!/bin/bash

function SYNC_DOTFILES () {

    for i in "$(pwd)"/.*
    do
        if [ ! -f "$HOME/$(basename "$i")" ]; then
            echo "$HOME/$(basename "$i") not found !"
            touch "$HOME/$(basename "$i")"
        fi
    done

    # rsync --exclude ".aliases" \
    #     --exclude ".bash_profile" \
    #     --exclude ".bashrc" \
    #     --exclude ".git" \
    #     --exclude ".powerlevel9k" \
    #     --exclude ".zshrc" \
    #     --exclude "README.md" \
    #     --exclude "install.sh" \
    #     --exclude "scripts" \
    #     -avh --no-perms . ~;
    # source ~;
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

# INSTALL_BREW_STUFF

SYNC_DOTFILES
