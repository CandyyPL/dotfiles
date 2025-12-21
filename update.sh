#!/bin/bash

DEFAULT_CONFIG_DIR="$HOME/.config"

# Colors
RED="\e[31m"
GREEN="\e[32m"
RESET="\e[0m"

function help() {
  echo "usage: ./install.sh [prog]"
  echo "Install all dotfiles: ./install.sh all"

  exit
}

function update() {
  local prog=$1

  if [[ ! -e "$DEFAULT_CONFIG_DIR/$prog" || ! -d "$DEFAULT_CONFIG_DIR/$prog" ]]; then
    echo -e "[${RED}-${RESET}] $prog directory not found"
    return
  fi

  echo -e "[${GREEN}+${RESET}] Updating $prog.."

  wd=$(pwd)
  prog_dir="$wd/config/"

  cp -r "$DEFAULT_CONFIG_DIR/$prog" $prog_dir
}

if [[ $# -eq 0 ]]; then
  help
fi

for arg in "$@"; do
  update $arg
done

echo -e "[${GREEN}+${RESET}] Dotfiles updated successfully!"
