#!/bin/bash

read -p "
Hi $USER. I'm Woosh {@.@}, your personnal robot assistant. Choose what you wanna do:

    [1] Install apt packages
    [2] Install Docker & Docker Compose
    [3] Copy config files (aliases, functions, etc..)
     -
    [0] Exit

[0-3]: " -n 1 -r

if [[ $REPLY -eq 1 ]] ; then
    source bin/apt.sh
elif [[ $REPLY -eq 2 ]] ; then
    source bin/docker.sh
elif [[ $REPLY -eq 3 ]] ; then
    source bin/cp.sh
else
    return 0
fi
