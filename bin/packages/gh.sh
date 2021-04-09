#!/bin/bash

source bin/utils.sh

RUN_COMMAND "$ISUDO" apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
RUN_COMMAND "$ISUDO" apt-add-repository https://cli.github.com/packages