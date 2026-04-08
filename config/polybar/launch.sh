#!/bin/bash

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar top &

if [[ $(xrandr -q | rg 'HDMI-1 connected') ]]; then
  polybar top_external &
fi
