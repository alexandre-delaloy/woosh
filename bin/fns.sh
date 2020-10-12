#!/bin/bash

source bin/ui.sh

function UPDATE_APT_PACKAGES() {
  COMMAND_STATUS '-' "apt update"
  sudo apt update
  if [[ "$?" = 0 ]] ; then
    COMMAND_STATUS 'v' "apt update"
    return 0;
  else
    COMMAND_STATUS 'x' "apt update"
    return 1
  fi
}

function UPGRADE_APT_PACKAGES () {
  COMMAND_STATUS '-' "apt upgrade"
  sudo apt upgrade
  if [[ "$?" = 0 ]] ; then
    COMMAND_STATUS 'v' "apt upgrade"
    return 0;
  else
    COMMAND_STATUS 'x' "apt upgrade"
    return 1
  fi
}

function INSTALL_STATUS() {
  if [[ "$1" = "x" ]] ; then
    echo "$(red '[x]') $(blue "$2") $(red 'not installed.')"
  elif  [[ "$1" = "-" ]] ; then
    echo "$(yellow '[-]') $(blue "$2") $(yellow 'installing...')"
  elif  [[ "$1" = "v" ]] ; then
    echo "$(green '[v]') $(blue "$2") $(green 'successfully installed !')"
  fi 
}

function COMMAND_STATUS() {
  if [[ "$1" = "x" ]] ; then
    echo "$(red '[x]') $(blue "$2") $(red 'failed.')"
  elif  [[ "$1" = "-" ]] ; then
    echo "$(yellow '[-]') $(blue "$2") $(yellow 'running...')"
  elif  [[ "$1" = "v" ]] ; then
    echo "$(green '[v]') $(blue "$2") $(green 'succeed !')"
  fi 
}

function INSTALL_PACKAGE() {
  INSTALL_STATUS '-' \'"$1"\'
  sudo apt install "$1"
  if [[ "$?" = 0 ]] ; then
    INSTALL_STATUS 'v' \'"$1"\'
    return 0;
  else
    INSTALL_STATUS 'x' \'"$1"\'
    return 1
  fi
}

function CHECK_COMMAND_INSTALLATION() {
  which "$1" > /dev/null 2>&1
  if [[ "$?" = 0 ]] ; then
    INSTALL_STATUS 'v' \'"$1"\'
    return 0;
  else
    INSTALL_STATUS 'x' \'"$1"\'
    return 1
  fi
}