#!/bin/bash

source bin/colors.sh

woosh() {
  read -p "
  Hi $(fyellow "$(whoami)"). I'm $(fgreen "Woosh") $(green "(0.0)"), your personnal dotfile assistant. Choose what you wanna do:

    $(yellow "[1]") $(fyellow "Everything") below
    $(yellow "[2]") Install 
    $(yellow "[3]") Copy $(fyellow "dotfiless") (.aliases, .functions, etc..)
    -
    $(yellow "[0]") Exit

  [0-4]: " -n 1 -r NUMBER

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
  elif [[ $NUMBER -eq 4 ]] ; then
    echo "
      "
    source bin/docker.sh
  else
      return 0
  fi
  woosh
}

woosh