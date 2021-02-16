#!/bin/bash

sleep 2
source ./bin/utils.sh

which "sudo" > /dev/null 2>&1
if [[ "$?" = 0 ]] ; then
  ISUDO="sudo -E"
else
  ISUDO=""
fi

curl -sL https://deb.nodesource.com/setup_14.x | $ISUDO -E bash -