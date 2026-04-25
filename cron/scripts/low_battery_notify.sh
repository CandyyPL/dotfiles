#!/bin/bash

export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"

bat=$($HOME/scripts/battery_level.sh)
status=$(cat /sys/class/power_supply/BAT0/status)

if [[ $status == "Discharging" ]]; then
  if [[ $bat -le 30 ]] && [[ $bat -gt 10 ]]; then
    notify-send -u normal -a "System" "Low Battery ($bat%)" "Connect the charger"
  fi

  if [[ $bat -le 10 ]]; then
    notify-send -u critical -a "System" "Low Battery ($bat%)" "Thinkpad is about to shutdown!\nPlug it in!"
  fi
fi

