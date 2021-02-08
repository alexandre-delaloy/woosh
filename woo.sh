#!/bin/bash

source bin/colors.sh

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
        - xclip
        - zsh
    $(yellow "[3]") Copy $(fyellow "dotfiles") (.aliases, .functions, etc..)
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

  if [[ $NUMBER = "1" ]] ; then
    echo "
    "
    source bin/apt.sh
    source bin/cp.sh
    source bin/docker.sh
  elif [[ $NUMBER = "2" ]] ; then
    echo "
      "
    source bin/apt.sh
  elif [[ $NUMBER = "3" ]] ; then
    echo "
      "
    source bin/cp.sh
  elif [[ $NUMBER = "4" ]] ; then
    echo "
      "
    source bin/snaps.sh
  elif [[ $NUMBER = "5" ]] ; then
    echo "
      "
    source bin/snaps.sh 5
  elif [[ $NUMBER = "6" ]] ; then
    echo "
      "
    source bin/snaps.sh 6
  elif [[ $NUMBER = "7" ]] ; then
    echo "
      "
    source bin/snaps.sh 7
  else
      return 0
  fi
  woosh
}

woosh