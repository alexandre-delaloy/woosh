#!/bin/bash

source bin/utils.sh

source config/.exports

function CHECK_SNAP_INSTALL() {
  # remove ' --classic' from the snap packet
  local CMD=$(echo "$1" | sed -e 's/ --classic//g')
  # check the location of the snap binary
  which "$CMD" > /dev/null 2>&1
  # check if the command status exit is zero
  if [[ "$?" = 0 ]] ; then
    INSTALL_STATUS 'v' \'"$CMD"\'
    return 0
  else
    INSTALL_STATUS 'x' \'"$CMD"\'
    return 1
  fi
}

function INSTALL_CHAT_SNAPS() {
  for ((i = 0; i < ${#_SNAP_CHAT_PACKAGES[@]}; i++)) ; do
    local SNAP=${_SNAP_CHAT_PACKAGES[$i]}
    sudo snap install $SNAP
    CHECK_SNAP_INSTALL $SNAP
  done
}

function INSTALL_DEV_SNAPS() {
  for ((i = 0; i < ${#_SNAP_DEV_PACKAGES[@]}; i++)) ; do
    local SNAP=${_SNAP_DEV_PACKAGES[$i]}
    sudo snap install $SNAP
    CHECK_SNAP_INSTALL $SNAP
  done
}

function INSTALL_MISC_SNAPS() {
  for ((i = 0; i < ${#_SNAP_MISC_PACKAGES[@]}; i++)) ; do
    local SNAP=${_SNAP_MISC_PACKAGES[$i]}
    sudo snap install $SNAP
    CHECK_SNAP_INSTALL $SNAP
  done
}

sudo snap refresh

if [[ $1 -eq 5 ]] ; then
  INSTALL_DEV_SNAPS
elif [[ $1 -eq 6 ]] ; then
  INSTALL_CHAT_SNAPS
elif [[ $1 -eq 7 ]] ; then
  INSTALL_MISC_SNAPS
else
  INSTALL_DEV_SNAPS
  INSTALL_CHAT_SNAPS
  INSTALL_MISC_SNAPS
fi