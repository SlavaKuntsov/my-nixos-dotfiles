
# Terminate already running bar instances
pkill -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch Polybar, using default config location ~/.config/polybar/config.ini
polybar bar 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."
