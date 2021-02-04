#!/bin/bash

source bin/utils.sh

if [ $1 = "4.1" ] ; then
  sudo snap install kubectl --classic 
  CHECK_COMMAND_INSTALLATION kubectl
elif [ $1 = "4.2" ] ; then
  sudo snap install slack
  CHECK_COMMAND_INSTALLATION slack

  sudo snap install discord
  CHECK_COMMAND_INSTALLATION discord

  sudo snap install telegram-desktop
  CHECK_COMMAND_INSTALLATION telegram-desktop
else
  sudo snap install kubectl --classic 
  CHECK_COMMAND_INSTALLATION kubectl

  sudo snap install discord
  CHECK_COMMAND_INSTALLATION discord

  sudo snap install telegram-desktop
  CHECK_COMMAND_INSTALLATION telegram-desktop
fi