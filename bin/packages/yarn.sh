#!/bin/bash

source ./bin/utils.sh

RUN_COMMAND curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | $ISUDO apt-key add -
RUN_COMMAND $(echo "deb https://dl.yarnpkg.com/debian/ stable main" | $ISUDO tee /etc/apt/sources.list.d/yarn.list)