#!/bin/bash

source bin/ui.sh

export function UPDATE_APT_PACKAGES() {
  INSTALL_STATUS_COMMAND '-' "apt update"
  sudo apt update
  if [[ "$?" = 0 ]] ; then
    INSTALL_STATUS_COMMAND 'v' "apt update"
    return 0;
  else
    INSTALL_STATUS_COMMAND 'x' "apt update"
    return 1
  fi
}

export function UPGRADE_APT_PACKAGES() {
  INSTALL_STATUS_COMMAND '-' "apt upgrade"
  sudo apt upgrade
  if [[ "$?" = 0 ]] ; then
    INSTALL_STATUS_COMMAND 'v' "apt upgrade"
    return 0;
  else
    INSTALL_STATUS_COMMAND 'x' "apt upgrade"
    return 1
  fi
}


function INSTALL_STATUS() {
  if [[ "$1" = "x" ]] ; then
    echo "$(red '[x]') $(blue $2) $(red 'not installed.')"
  elif  [[ "$1" = "-" ]] ; then
    echo "$(yellow '[-]') $(blue $2) $('installing...')"
  elif  [[ "$1" = "v" ]] ; then
    echo "$(green '[v]') $(blue $2) $('successfully installed') !"
  fi 
}

function INSTALL_STATUS_COMMAND() {
  if [[ "$1" = "x" ]] ; then
    echo "$(red '[x]') $(blue $2) $(red 'failed.')"
  elif  [[ "$1" = "-" ]] ; then
    echo "$(yellow '[-]') $(blue $2) $(yellow 'running...')"
  elif  [[ "$1" = "v" ]] ; then
    echo "$(green '[v]') $(blue $2) $(green 'succeed !')"
  fi 
}

function INSTALL_PACKAGE() {
  INSTALL_STATUS '-' \'"$1"\'
  apt install $1 -y
  if [[ "$?" = 0 ]] ; then
    INSTALL_STATUS 'v' \'"$1"\'
    return 0;
  else
    INSTALL_STATUS 'x' \'"$1"\'
    return 1
  fi
}