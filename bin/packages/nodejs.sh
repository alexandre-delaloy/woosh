#!/bin/bash

INSTALL_NODEJS() {
  which "sudo" > /dev/null 2>&1
  if [[ "$?" = 0 ]] ; then
    ISUDO="sudo"
  else
    ISUDO=""
  fi

  cd ~

  curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh

  $ISUDO bash nodesource_setup.sh

  rm -rf ~/nodesource_setup.sh

  cd -
}