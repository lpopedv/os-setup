#!/bin/sh

if pacman -Q aether &> /dev/null; then
    echo "✅ aether is already installed. Skipping..."
else
    echo "📦 Installing aether..."
    yay -S --noconfirm --needed aether
fi

