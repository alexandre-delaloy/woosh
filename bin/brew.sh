#!/bin/bash

function BREW() {
    # install brew
    if [ "$(command -v brew)" ] ; then 
        echo "brew not found. Installing brew.."
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
    # be sure this is the latest version
    brew update
    # upgrade any already-installed formulae.
    brew upgrade
    # install all given brew formulae
    for i in "${BREW_FORMULAE[@]}" ; do brew install "$i" ; done
    # install all given brew casks
    for i in "${BREW_CASK[@]}" ; do brew cask install "$i" ; done
    # remove outdated versions
    brew cleanup
    # diagnosis formulae
    brew doctor
}