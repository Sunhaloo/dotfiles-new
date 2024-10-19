#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use
# polybar-msg cmd quit
# Otherwise you can use the nuclear option:
killall -q polybar

# Launch bar1 and bar2
# Launch Polybar, using default config location ~/.config/polybar/config.ini
polybar --config=$HOME/.config/polybar/config.ini mybar &
echo "---" | tee -a /tmp/polybar1.log
polybar bar1 2>&1 | tee -a /tmp/polybar1.log &
disown
disown
polybar bar2 2>&1 | tee -a /tmp/polybar2.log &

echo "Bars launched..."
