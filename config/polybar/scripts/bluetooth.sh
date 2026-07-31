#!/bin/bash

bt_on=0
status=$(systemctl status bluetooth | grep "active (running)")

if [[ $status == "" ]]; then
  bt_on=0
else
  bt_on=1
fi

dev=""

if [[ $bt_on -eq 1 ]]; then
  dev=$(bluetoothctl devices Connected | cut -d ' ' -f3-)
fi

if [[ $bt_on -eq 1 ]]; then
  if [[ $dev == "" ]]; then
    echo "%{F#60ace6}bt%{F-} ON"
  else
    echo "%{F#60ace6}bt%{F-} $dev"
  fi
else
  echo "%{F#60ace6}bt%{F-} %{F#6c7086}OFF%{F-}"
fi

