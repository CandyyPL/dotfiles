#!/bin/bash

name=$(pactl list sinks | rg 'Name: bluez' --trim | awk '{print $2}')

if [[ name != '' ]]; then
  pactl set-default-sink $name
fi
