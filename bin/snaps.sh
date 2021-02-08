#!/bin/bash

# slack --classic
# teams
# telegram-desktop
# discord

# code --classic
# cool-retro-term
# kubectl --classic
# kontena-lens --classic
# postman 
# arduino 

# vlc
# gimp

source bin/utils.sh

sudo snap refresh

function INSTALL_CHAT_SNAPS() {
  sudo snap install slack --classic
  CHECK_COMMAND_INSTALLATION slack

  sudo snap install teams
  CHECK_COMMAND_INSTALLATION teams

  sudo snap install telegram-desktop
  CHECK_COMMAND_INSTALLATION telegram-desktop

  sudo snap install discord
  CHECK_COMMAND_INSTALLATION discord
}
function INSTALL_DEV_SNAPS() {
  sudo snap install code --classic 
  CHECK_COMMAND_INSTALLATION code

  sudo snap install cool-retro-term --classic 
  CHECK_COMMAND_INSTALLATION cool-retro-term
  
  sudo snap install kubectl --classic 
  CHECK_COMMAND_INSTALLATION kubectl

  sudo snap install kontena-lens --classic 
  CHECK_COMMAND_INSTALLATION kontena-lens

  sudo snap install postman 
  CHECK_COMMAND_INSTALLATION postman

  sudo snap install arduino 
  CHECK_COMMAND_INSTALLATION arduino
}

function INSTALL_MISC_SNAPS() {
  sudo snap install vlc
  CHECK_COMMAND_INSTALLATION vlc
  
  sudo snap install gimp
  CHECK_COMMAND_INSTALLATION gimp
}

if [ $1 = "5" ] ; then
  INSTALL_DEV_SNAPS
elif [ $1 = "6" ] ; then
  INSTALL_CHAT_SNAPS
elif [ $1 = "7" ] ; then
  INSTALL_MISC_SNAPS
else
  INSTALL_DEV_SNAPS
  INSTALL_CHAT_SNAPS
  INSTALL_MISC_SNAPS
fi