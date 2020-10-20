#!/bin/bash

source bin/ui.sh

function RUN_COMMAND() {
  COMMAND_STATUS "-" \'"$*"\'
  "$*"
   if [[ "$?" = 0 ]] ; then
   COMMAND_STATUS 'v' \'"$*"\'
    return 0
  else
   COMMAND_STATUS 'x' \'"$*"\'
    return 1
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
    return 0
  else
    INSTALL_STATUS 'x' \'"$1"\'
    return 1
  fi
}
function INSTALL_STATUS() {
  if [[ "$1" = "x" ]] ; then
    echo -e "$(red '[x]') $(blue "$2") $(red 'not installed.')"
  elif  [[ "$1" = "-" ]] ; then
    echo "$(yellow '[-]') $(blue "$2") $(yellow 'installing...')"
  elif  [[ "$1" = "v" ]] ; then
    echo "$(green '[v]') $(blue "$2") $(green 'successfully installed !')"
  fi 
}

function COPY_FILE() {
  cp "$1$2" "$3"
  if [[ -f $2/$3 ]] ; then
    CP_STATUS 'v' \'"$2"\'
    return 0
  else
    CP_STATUS 'x' \'"$2"\'
    return 1
  fi
}
function CP_STATUS() {
  if [[ "$1" = "x" ]] ; then
    echo "$(red '[x]') $(blue "$2") $(red 'not copied.')"
  elif  [[ "$1" = "-" ]] ; then
    echo "$(yellow '[-]') $(blue "$2") $(yellow 'copying...')"
  elif  [[ "$1" = "v" ]] ; then
    echo "$(green '[v]') $(blue "$2") $(green 'copied !')"
  fi 
}

function CHECK_COMMAND_INSTALLATION() {
  which "$1" > /dev/null 2>&1
  if [[ "$?" = 0 ]] ; then
    INSTALL_STATUS 'v' \'"$1"\'
    return 0
  else
    INSTALL_STATUS 'x' \'"$1"\'
    return 1
  fi
}