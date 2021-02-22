#!/bin/bash

function launch_tmux() {
  read -p "$(echo -e  '\e[1;30;43mLaunch tmux workspace ? [Y/n]\e[0m') " -n 1 -r YN
  echo    # (optional) move to a new line
  if [[ $YN =~ ^[Yy]$ ]] ; then
    tmux new-session \; \
      kill-session -a \; \
      send-keys '%htop' C-m \; \
      split-window -v -p 66 \; \
      split-window -h -p 50 \; \
      send-keys '%cd ~/_/CONFIG/woosh ; bash woo.sh' C-m \; \
      select-pane -t 1 \; \
      send-keys '%cd ; clear ; date ; printf "\n" ; hostnamectl' C-m \; \
      split-window -v \; \
      send-keys '%cd ~/_ ; clear ; ls -l' C-m \; \
      setw -g mouse on
  else
    return 0
  fi
}

launch_tmux