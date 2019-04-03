#!/bin/bash

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