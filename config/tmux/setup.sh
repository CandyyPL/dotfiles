#!/bin/bash

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
RESET="\e[0m"

if [[ -e "$HOME/.tmux/plugins/tpm" ]]; then
  echo -e "[${YELLOW}!${RESET}] .tmux directory with tpm already exist (~/.tmux/plugins/tpm)"
  echo -en "[${YELLOW}?${RESET}] Do you want to delete ~/.tmux ? [y/N]: "
  read x

  if [[ $x == 'y' ]] || [[ $x == 'Y' ]]; then
    rm -rf $HOME/.tmux
  else
    echo -e "[${RED}-${RESET}] Aborting.."
    exit
  fi
fi

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
