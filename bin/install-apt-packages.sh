#!/bin/bash

source bin/utils.sh

function INSTALL_APT_PACKAGES() {
  which "sudo" > /dev/null 2>&1
  if [[ "$?" = 0 ]] ; then
    local ISUDO="sudo"
  else
    local ISUDO=""
  fi

  RUN_COMMAND $ISUDO apt update -y
  RUN_COMMAND $ISUDO apt upgrade -y

  INSTALL_PACKAGE curl

  # source bin/packages/gh.sh
  # source bin/packages/node-npm-yarn.sh

  INSTALL_PACKAGE git
  # INSTALL_PACKAGE gh
  INSTALL_PACKAGE htop
  INSTALL_PACKAGE shellcheck
  INSTALL_PACKAGE tmux
  INSTALL_PACKAGE xclip
  # INSTALL_PACKAGE nodejs
  INSTALL_PACKAGE zsh
}