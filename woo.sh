#!/bin/bash

source bin/colors.sh

clear

woosh() {
  read -p "
  Hi $(fyellow "$(whoami)"). I'm $(fgreen "Woosh") $(green "(0.0)"), your personal dotfile configuration assistant.
  
  Choose what you wanna do:

    $(green "[1]") $(fgreen "Everything below")
    $(yellow "[2]") Install $(fyellow "apt packages")
        - curl
        - git
        - htop
        - shellcheck
        - tmux
        - xclip
        - zsh
    $(yellow "[3]") Copy $(fyellow "dotfiles") (.aliases, .functions, etc..)
        - .aliases
        - .functions
        - .blyndusk-theme.cool-retro-theme
        - .tmux.sh
    $(yellow "[4]") Install $(fyellow "all snap packages") below
    $(yellow "[5]") Install $(fgreen "[dev]") $(fyellow "snap packages")
        - vscode
        - kubectl
        - lens
        - postman
        - arduino
        - cool retro term
    $(yellow "[6]") Install $(fgreen "[chat]") $(fyellow "snap packages")
        - slack
        - teams
        - telegram
        - discord
    $(yellow "[7]") Install $(fgreen "[misc]") $(fyellow "snap packages") 
        - vlc
        - gimp
    -
    $(red "[0]") $(fred "Exit")

  [0-7]: " -n 1 -r NUMBER

  if [[ $NUMBER -eq 1 ]] ; then
    echo "
    "
    source bin/apt.sh
    source bin/cp.sh
    # source bin/docker.sh
    source bin/snaps.sh
  elif [[ $NUMBER -eq 2 ]] ; then
    echo "
      "
    source bin/apt.sh
  elif [[ $NUMBER -eq 3 ]] ; then
    echo "
      "
    source bin/cp.sh
  elif [[ $NUMBER -eq 4 ]] ; then
    echo "
      "
    source bin/snaps.sh
  elif [[ $NUMBER -eq 5 ]] ; then
    echo "
      "
    source bin/snaps.sh 5
  elif [[ $NUMBER -eq 6 ]] ; then
    echo "
      "
    source bin/snaps.sh 6
  elif [[ $NUMBER -eq 7 ]] ; then
    echo "
      "
    source bin/snaps.sh 7
  else
      return 0
  fi
  woosh
}

woosh