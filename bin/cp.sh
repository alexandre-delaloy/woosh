#!/bin/bash

echo "
"

source bin/utils.sh

COPY_FILE config/ .aliases ~
COPY_FILE config/ .functions ~

echo "
source ~/.aliases
" >> ~/.zshrc