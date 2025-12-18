#!/bin/sh

update=$(yay -Qu | wc -l)

if [[ "$update" -gt 0 ]]; then
  echo "%{F#eba0ac}  $update%{F-}"
else
  echo "Up to date"
fi
