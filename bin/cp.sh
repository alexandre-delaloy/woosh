#!/bin/bash

echo "
"

source bin/fns.sh

COPY_FILE config/ .aliases ~
COPY_FILE config/ .functions ~

echo "
source ~/.aliases
" >> ~/.zshrc