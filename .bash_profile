#!/bin/bash

# import .functions dotfile if the file exist
if [ -f ~/.aliases ] ; then . ~/.aliases ; fi
# import .functions dotfile if the file exist
if [ -f ~/.exports ] ; then . ~/.exports ; fi
# import .functions dotfile if the file exist
if [ -f ~/.functions ] ; then . ~/.functions ; fi