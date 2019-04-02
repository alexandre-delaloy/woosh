#!/bin/bash

# import .bash_aliases dotfile if the file exist
if [ -f ~/.aliases ] ; then . ~/.aliases ; fi
# import .functions dotfile if the file exist
if [ -f ~/.functions ] ; then . ~/.functions ; fi
# import .functions dotfile if the file exist
if [ -f ~/.powerlevel9k ] ; then . ~/.powerlevel9k ; fi