#!/bin/bash

cap=$(cat /sys/class/power_supply/BAT0/capacity)

if [[ $cap -gt 30 ]]; then
  echo "%{F#74c7ec}BAT%{F-} $cap%"
elif [[ $cap -le 30 ]] && [[ $cap -gt 10 ]]; then
  echo "%{F#74c7ec}BAT%{F-} %{F#f2e452}$cap%%{F-}"

elif [[ $cap -le 10 ]]; then
  echo "%{F#74c7ec}BAT%{F-} %{F#eb634b}$cap%%{F-}"
fi

