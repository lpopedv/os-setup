#!/bin/sh

set -e

HYPRIDLE_CONFIG="$HOME/.config/hypr/hypridle.conf"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OVERRIDES_CONFIG="$SCRIPT_DIR/hypridle-overrides.conf"

# Check if overrides config exists
if [ ! -f "$OVERRIDES_CONFIG" ]; then
    echo "Overrides config not found at $OVERRIDES_CONFIG"
    return 1
fi

# Create hypridle config directory if it doesn't exist
mkdir -p "$HOME/.config/hypr"

# Backup existing config if it exists
if [ -f "$HYPRIDLE_CONFIG" ]; then
    echo "Backing up existing hypridle config to $HYPRIDLE_CONFIG.backup"
    cp "$HYPRIDLE_CONFIG" "$HYPRIDLE_CONFIG.backup"
fi

# Copy overrides to hypridle config
echo "Installing hypridle overrides to $HYPRIDLE_CONFIG"
cp "$OVERRIDES_CONFIG" "$HYPRIDLE_CONFIG"

# Restart hypridle if it's running
if pgrep -x hypridle > /dev/null; then
    echo "Restarting hypridle service..."
    killall hypridle
    hypridle &
    echo "Hypridle restarted"
else
    echo "Hypridle is not running. Start it manually or it will start on next login."
fi

echo "Hypridle overrides setup complete!"
