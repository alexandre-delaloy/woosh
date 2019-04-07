#!/bin/bash
# shellcheck disable=SC1090

# import .aliases dotfile if the file exist
if [ -f ~/.aliases ] ; then . ~/.aliases ; fi
# import .exports dotfile if the file exist
if [ -f ~/.exports ] ; then . ~/.exports ; fi
# import .functions dotfile if the file exist
if [ -f ~/.functions ] ; then . ~/.functions ; fi