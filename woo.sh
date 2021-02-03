#!/bin/bash

source bin/colors.sh

woosh() {
  read -p "
  Hi $(fyellow "$(whoami)"). I'm $(fgreen "Woosh") $(green "(0.0)"), your personal dotfile configuration assistant.
  
  Choose what you wanna do:

    $(green "[1]") $(fgreen "Everything below")
    $(yellow "[2]") Install $(fyellow "apt packages")
    $(yellow "[3]") Copy $(fyellow "dotfiles") (.aliases, .functions, etc..)
    -
    $(red "[0]") $(fred "Exit")

  [0-3]: " -n 1 -r NUMBER

  if [[ $NUMBER -eq 1 ]] ; then
    echo "
    "
    source bin/apt.sh
    source bin/cp.sh
    source bin/docker.sh
  elif [[ $NUMBER -eq 2 ]] ; then
    echo "
      "
    source bin/apt.sh
  elif [[ $NUMBER -eq 3 ]] ; then
    echo "
      "
    source bin/cp.sh
  # elif [[ $NUMBER -eq 4 ]] ; then
  #   echo "
  #     "
  #   source bin/docker.sh
  else
      return 0
  fi
  woosh
}

woosh