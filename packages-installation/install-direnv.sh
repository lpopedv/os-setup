#!/bin/sh

if pacman -Q direnv &> /dev/null; then
    echo "✅ direnv is already installed. Skipping..."
else
    echo "📦 Installing direnv..."
    yay -S --noconfirm --needed direnv
fi
