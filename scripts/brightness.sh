#!/bin/bash

current=$(brightnessctl g)

if [[ $1 == "lower" ]]; then
  if [[ $current -ge 3878 ]]; then
    brightnessctl s 10%-
  fi
fi

if [[ $1 == "raise" ]]; then
  brightnessctl s +10%
fi
