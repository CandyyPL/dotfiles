#!/bin/bash

DEFAULT_CONFIG_DIR="$HOME/.config"
DIRS=()
MAX_DIR_LENGTH=0

# Colors
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
RESET="\e[0m"

function is_installed() {
  local prog=$1

  link_path="$DEFAULT_CONFIG_DIR/$prog"
  config_path="config/$prog"

  if [[ -L "$link_path" && "$link_path" -ef "$config_path" ]]; then
    return 0
  else
    return 1
  fi
}

function help() {
  echo "usage: ./install.sh [prog]"
  echo
  echo "Current dotfiles status:"

  local padding=$(($MAX_DIR_LENGTH + 4))

  for dir in ${DIRS[@]}; do
    if is_installed $dir; then
      printf "%-*s %b\n" "$padding" "$dir" "[   ${GREEN}INSTALLED${RESET}   ]"
    else
      printf "%-*s %b\n" "$padding" "$dir" "[ ${YELLOW}NOT INSTALLED${RESET} ]"
    fi
  done

  echo
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

  ln -s $prog_dir "$DEFAULT_CONFIG_DIR/$prog"
}

for path in config/*; do
  dir=$(basename "$path")
  DIRS+=($dir)

  if [[ ${#dir} -gt $MAX_DIR_LENGTH ]]; then
    MAX_DIR_LENGTH=${#dir}
  fi
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

echo
echo -e "[${GREEN}+${RESET}] Dotfiles linked successfully!"
