#!/usr/bin/env bash

# kill the polybar if its already running
killall -q polybar

# launch the actual polybar
polybar --config=$HOME/.config/polybar/config.ini mybar &
echo "---" | tee -a /tmp/polybar1.log
polybar bar1 2>&1 | tee -a /tmp/polybar1.log &
disown
disown
polybar bar2 2>&1 | tee -a /tmp/polybar2.log &

echo "Bars launched..."
