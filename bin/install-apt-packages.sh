#!/bin/bash

source bin/utils.sh
source config/.exports

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

  for ((i = 0; i < ${#_APT_PACKAGES[@]}; i++)) ; do
    local APT=${_APT_PACKAGES[$i]}
      INSTALL_PACKAGE $APT
  done
}