#!/bin/bash

source bin/utils.sh

function INSTALL_CHAT_SNAPS() {
  sudo snap install slack
  CHECK_COMMAND_INSTALLATION slack

  sudo snap install teams
  CHECK_COMMAND_INSTALLATION teams

  sudo snap install telegram-desktop
  CHECK_COMMAND_INSTALLATION telegram-desktop

  sudo snap install discord
  CHECK_COMMAND_INSTALLATION discord
}
function INSTALL_DEV_SNAPS() {
  sudo snap install kubectl --classic 
  CHECK_COMMAND_INSTALLATION kubectl

  
}

if [ $1 = "4.1" ] ; then
  sudo snap install kubectl --classic 
  CHECK_COMMAND_INSTALLATION kubectl
elif [ $1 = "4.2" ] ; then
  INSTALL_CHAT_SNAPS
else
  sudo snap install kubectl --classic 
  CHECK_COMMAND_INSTALLATION kubectl

  sudo snap install discord
  CHECK_COMMAND_INSTALLATION discord

  sudo snap install telegram-desktop
  CHECK_COMMAND_INSTALLATION telegram-desktop
fi

# vscode
# discord
# gimp
# lens
# kubectl
# postman
# slack
# spotify
# telegram-desktop
# vlc