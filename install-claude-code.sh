#!/bin/sh

if pacman -Q claude-code &> /dev/null; then
    echo "✅ claude-code is already installed. Skipping..."
else
    echo "📦 Installing claude-code..."
    yay -S --noconfirm --needed claude-code
fi
