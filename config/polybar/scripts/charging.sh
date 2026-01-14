status=$(cat /sys/class/power_supply/BAT0/status)

if [[ $status == "Discharging" ]]; then
  echo "%{F#6c7086}D%{F-}"
else
  echo "%{F#13d139}C%{F-}"
fi
