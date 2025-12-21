#!/bin/bash

DEFAULT_CONFIG_DIR="$HOME/.config"
DIRS=()

# Colors
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
RESET="\e[0m"

function help() {
  echo "usage: ./install.sh [prog]"
  echo "Install all dotfiles: ./install.sh all"

  exit
}

function install() {
  local prog=$1

  if [[ ! -e "config/$prog" || ! -d "config/$prog" ]]; then
    echo -e "[${RED}-${RESET}] $prog directory not found"
    return
  fi

  echo -e "[${GREEN}+${RESET}] Installing $prog.."

  if [[ -e "config/$prog/setup.sh" ]]; then
    echo -e "[${GREEN}+${RESET}] Executing additional scripts for $prog.."
    bash "config/$prog/setup.sh"
  fi

  wd=$(pwd)
  prog_dir="$wd/config/$prog"

  cp -r $prog_dir "$DEFAULT_CONFIG_DIR/"
}

for path in config/*; do
  dir=$(basename "$path")
  DIRS+=($dir)
done

if [[ $# -eq 0 ]]; then
  help
fi

if [[ $1 == "all" ]]; then
  for dir in ${DIRS[@]}; do
    install $dir
  done

  exit 0
fi

for arg in "$@"; do
  install $arg
done

echo -e "[${GREEN}+${RESET}] Dotfiles installed successfully!"
