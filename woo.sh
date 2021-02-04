#!/bin/bash

source bin/colors.sh

woosh() {
  read -p "
  Hi $(fyellow "$(whoami)"). I'm $(fgreen "Woosh") $(green "(0.0)"), your personal dotfile configuration assistant.
  
  Choose what you wanna do:

    $(green "[1]") $(fgreen "Everything below")
    $(yellow "[2]") Install $(fyellow "apt packages")
    $(yellow "[3]") Copy $(fyellow "dotfiles") (.aliases, .functions, etc..)
    $(yellow "[4]")   Install $(fgreen "all") $(fyellow "snap packages")
    $(yellow "[4.1]") Install $(fgreen "[dev]") $(fyellow "snap packages") (vscode, terminator, postman, kubectl, lens)
    $(yellow "[4.2]") Install $(fgreen "[chat]") $(fyellow "snap packages") (slack, teams, telegram-desktop, discord)
    -
    $(red "[0]") $(fred "Exit")

  [0-3]: " -n 3 -r NUMBER

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
  elif [[ $NUMBER = "4.1" ]] ; then
    echo "
      "
    source bin/snaps.sh 4.1
  elif [[ $NUMBER = "4.2" ]] ; then
    echo "
      "
    source bin/snaps.sh 4.2
  else
      return 0
  fi
  woosh
}

woosh