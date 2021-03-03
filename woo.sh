#!/bin/bash

source bin/colors.sh

source bin/install-apt-packages.sh # INSTALL_APT_PACKAGES
source bin/install-snap-packages.sh # INSTALL_SNAP_PACKAGES
source bin/install-config-files.sh # INSTALL_CONFIG_FILES

WOOSH() {
  printf "\n" ; read -p "
================= $(fyellow "Woosh") $(yellow "{@.@}") =================

  $(fblue 'an Ubuntu configuration setup assistant')

==================== $(fgreen '@2.1.0') ===================
  
  Hi $(fblue "$(whoami)")! Choose what you wanna do:

    $(green "[1]") $(fgreen "Everything below")
    $(yellow "[2]") Install $(fyellow "apt packages")
    $(yellow "[3]") Copy $(fyellow "dotfiles") and $(fyellow "applications config")
    $(yellow "[4]") Install $(fyellow "all snap packages") below
    $(yellow "[5]") Install $(fyellow "snap packages"): $(fgreen "[dev]")
    $(yellow "[6]") Install $(fyellow "snap packages"): $(fgreen "[chat]")
    $(yellow "[7]") Install $(fyellow "snap packages"): $(fgreen "[misc]")
    -
    $(red "[0]") $(fred "Exit")

  [0-7]: " -n 1 -r NUMBER ; printf "\n\n"

  if [[ $NUMBER -eq 1 ]] ; then
    INSTALL_APT_PACKAGES
    INSTALL_CONFIG_FILES
    INSTALL_SNAP_PACKAGES
  elif [[ $NUMBER -eq 2 ]] ; then
    INSTALL_APT_PACKAGES
  elif [[ $NUMBER -eq 3 ]] ; then
    INSTALL_CONFIG_FILES
  elif [[ $NUMBER -eq 4 ]] ; then
    INSTALL_SNAP_PACKAGES
  elif [[ $NUMBER -eq 5 ]] ; then
    INSTALL_SNAP_PACKAGES 5
  elif [[ $NUMBER -eq 6 ]] ; then
    INSTALL_SNAP_PACKAGES 6
  elif [[ $NUMBER -eq 7 ]] ; then
    INSTALL_SNAP_PACKAGES 7
  else
    return 0
  fi
  
  printf "\n$(fyellow 'Terminating...')" ; sleep 1.2

  WOOSH
}

clear ; WOOSH