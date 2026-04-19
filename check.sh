#!/bin/bash

DEFAULT_CONFIG_DIR="$HOME/.config"

# Colors
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
RESET="\e[0m"

function help() {
  echo "usage: ./check.sh"
  exit
}

ulimit -n 1024

for path in config/*; do
  dir=$(basename "$path")
  if [[ -d "config/$dir" ]]; then
    DIRS+=($dir)
  fi
done

function check_diff() {
  local prog=$1

  if diff -rq "config/$prog" "$DEFAULT_CONFIG_DIR/$prog" >/dev/null; then
    echo -e "[${GREEN}+${RESET}] $prog is up to date"
  else
    echo -e "[${YELLOW}!${RESET}] $prog is is outdated"
  fi
}

function check() {
  local prog=$1

  if [[ ! -e "$DEFAULT_CONFIG_DIR/$prog" || ! -d "$DEFAULT_CONFIG_DIR/$prog" ]]; then
    echo -e "[${RED}-${RESET}] $prog is not installed"
    return
  fi

  check_diff $prog
}

for dir in ${DIRS[@]}; do
  check $dir
done
