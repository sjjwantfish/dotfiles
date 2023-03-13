#!/usr/bin/env bash

killall polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

primaryMonitor=`xrandr --query | grep " connected" | grep -i "primary" | awk '{print$1}'`

for m in $(polybar --list-monitors | cut -d":" -f1); do
  if [[ $m != $primaryMonitor ]]; then
    MONITOR=$m polybar --reload sidecar -c $HOME/.config/polybar/config.ini &
  else
    PRIMARY_MONITOR=$m polybar --reload main -c $HOME/.config/polybar/config.ini &
  fi
done
