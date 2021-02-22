#!/bin/bash

source bin/utils.sh

function update_zsh_file() {
  read -p "$(yellow 'Update zsh file ? [Y/n]') " -n 1 -r YN
  echo ; echo  # (optional) move to a new line
if [[ $YN =~ ^[Yy]$ ]] ; then
  echo "
source ~/.aliases
bash ~/.tmux.sh
  " >> ~/.zshrc
  else
    return 0
  fi
}

COPY_FILE config/ .aliases ~
COPY_FILE config/ .functions ~
COPY_FILE config/ .blyndusk-theme.cool-retro-theme.json ~
COPY_FILE config/ .tmux.sh ~

update_zsh_file
