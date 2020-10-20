#!/bin/bash

source bin/fns.sh

RUN_COMMAND echo "Oyy"
RUN_COMMAND sudo apt upgrade

INSTALL_PACKAGE curl
INSTALL_PACKAGE git
INSTALL_PACKAGE htop
INSTALL_PACKAGE shellcheck
INSTALL_PACKAGE xclip