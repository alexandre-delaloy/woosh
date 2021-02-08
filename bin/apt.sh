#!/bin/bash

source bin/utils.sh

which "sudo" > /dev/null 2>&1
if [[ "$?" = 0 ]] ; then
  ISUDO="sudo"
else
  ISUDO=""
fi

RUN_COMMAND $ISUDO apt update
RUN_COMMAND $ISUDO apt upgrade

INSTALL_PACKAGE curl

# source bin/packages/gh.sh
# source bin/packages/yarn.sh

INSTALL_PACKAGE git
# INSTALL_PACKAGE gh
INSTALL_PACKAGE htop
INSTALL_PACKAGE shellcheck
INSTALL_PACKAGE tmux
INSTALL_PACKAGE xclip
# INSTALL_PACKAGE yarn
INSTALL_PACKAGE zsh