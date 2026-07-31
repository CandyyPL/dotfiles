#!/bin/bash

action=$1
target=$2

if [[ $1 == 'y' ]]; then
  systemctl start $2
elif [[ $1 == 'n' ]]; then
  systemctl stop $2
elif [[ $1 == 'e' ]]; then
  systemctl enable $2
elif [[ $1 == 'd' ]]; then
  systemctl disable $2
elif [[ $1 == 's' ]]; then
  systemctl status $2
fi

