#!/bin/bash

source bin/utils.sh

source config/.exports

sudo snap refresh

function INSTALL_CHAT_SNAPS() {
  for ((i = 0; i < ${#_SNAP_CHAT_PACKAGES[@]}; i++))
  do
    sudo snap install "${_SNAP_CHAT_PACKAGES[$i]}"
    CHECK_COMMAND_INSTALLATION "${_SNAP_CHAT_PACKAGES[$i]}"
  done
}
function INSTALL_DEV_SNAPS() {
  for ((i = 0; i < ${#_SNAP_DEV_PACKAGES[@]}; i++))
  do
    sudo snap install "${_SNAP_DEV_PACKAGES[$i]}"
    CHECK_COMMAND_INSTALLATION "${_SNAP_DEV_PACKAGES[$i]}"
  done
}

function INSTALL_MISC_SNAPS() {
  for ((i = 0; i < ${#_SNAP_MISC_PACKAGES[@]}; i++))
  do
    sudo snap install "${_SNAP_MISC_PACKAGES[$i]}"
    CHECK_COMMAND_INSTALLATION "${_SNAP_MISC_PACKAGES[$i]}"
  done
}

if [ $1 -eq 5 ] ; then
  INSTALL_DEV_SNAPS
elif [ $1 -eq 6 ] ; then
  INSTALL_CHAT_SNAPS
elif [ $1 -eq 7 ] ; then
  INSTALL_MISC_SNAPS
else
  INSTALL_DEV_SNAPS
  INSTALL_CHAT_SNAPS
  INSTALL_MISC_SNAPS
fi