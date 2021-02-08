#!/bin/bash

source bin/utils.sh

COPY_FILE config/ .aliases ~
COPY_FILE config/ .functions ~
COPY_FILE config/ .blyndusk-theme.cool-retro-theme.json ~
COPY_FILE config/ .tmux.sh ~

echo "
source ~/.aliases
bash ~/.tmux.sh
" >> ~/.zshrc