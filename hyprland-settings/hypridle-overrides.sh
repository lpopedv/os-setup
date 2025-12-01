#!/bin/sh

set -eu

HYPRIDLE_CONFIG="$HOME/.config/hypr/hypridle.conf"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
OVERRIDES_CONFIG="$SCRIPT_DIR/hypridle-overrides.conf"
BACKUP_FILE="$HYPRIDLE_CONFIG.backup"

# --- RESTORE MODE ---
if [ "${1:-}" = "--restore" ]; then
    echo "Restore mode enabled"

    if [ ! -f "$BACKUP_FILE" ]; then
        echo "No backup found at $BACKUP_FILE"
        exit 1
    fi

    echo "Restoring backup..."
    cp "$BACKUP_FILE" "$HYPRIDLE_CONFIG"

    if pgrep -x hypridle > /dev/null; then
        echo "Restarting hypridle service..."
        pkill -x hypridle
        nohup hypridle >/dev/null 2>&1 &
        echo "Hypridle restarted"
    else
        echo "Hypridle is not running. Start it manually or it will start on next login."
    fi

    echo "Restore complete!"
    exit 0
fi

# --- NORMAL INSTALL MODE ---

# Check if overrides config exists
if [ ! -f "$OVERRIDES_CONFIG" ]; then
    echo "Overrides config not found at $OVERRIDES_CONFIG"
    exit 1
fi

# Ensure hypridle config directory exists
mkdir -p "$HOME/.config/hypr"

# Backup existing config (only once)
if [ -f "$HYPRIDLE_CONFIG" ] && [ ! -f "$BACKUP_FILE" ]; then
    echo "Backing up existing hypridle config to $BACKUP_FILE"
    cp "$HYPRIDLE_CONFIG" "$BACKUP_FILE"
fi

# Install override file
echo "Installing hypridle overrides to $HYPRIDLE_CONFIG"
cp "$OVERRIDES_CONFIG" "$HYPRIDLE_CONFIG"

# Restart hypridle if running
if pgrep -x hypridle > /dev/null; then
    echo "Restarting hypridle service..."
    pkill -x hypridle
    nohup hypridle >/dev/null 2>&1 &
    echo "Hypridle restarted"
else
    echo "Hypridle is not running. Start it manually or it will start on next login."
fi

echo "Hypridle overrides setup complete!"
