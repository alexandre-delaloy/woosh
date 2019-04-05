#!/usr/bin/env bash
# shellcheck disable=SC1091

. bin/sync.sh


if [[ "$1" == "-f" || "$1" == "--force" ]] ; then SYNC ;
else
    clear ; read -r -p  "Overwrite existing files ? (y/n) " -n 1 ;
    if [ $? -eq 0 ]; then clear
        if [[ $REPLY =~ ^[Yy]$ ]] ; then SYNC ;
        elif [[ $REPLY =~ ^[Nn]$ ]] ; then echo "Execution stopped"
        else echo -e "\e[38;5;1m$REPLY \e[38;5;15misn't an available value !" ; fi 
    else
        clear ; RETURNED="$1"
        echo "Overwrite existing files ? (y/n)" ; read -r RETURNED ; clear
        if [[ $RETURNED == "Y" ||  $RETURNED == "y" ]] ; then SYNC ;
        elif [[ $RETURNED == "N" ||  $RETURNED == "n" ]] ; then echo "Execution stopped"
        else echo -e "\e[38;5;1m$RETURNED \e[38;5;15misn't an available value !" ; fi 
    fi
fi;
