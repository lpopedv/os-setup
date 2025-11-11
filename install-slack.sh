#!/bin/sh

if pacman -Q slack-desktop &> /dev/null; then
    echo "✅ slack is already installed. Skipping..."
else
    echo "📦 Installing slack..."
    yay -S --noconfirm --needed slack-desktop
fi
