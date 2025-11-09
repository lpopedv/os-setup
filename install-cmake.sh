#!/bin/sh

if pacman -Q cmake &> /dev/null; then
    echo "✅ cmake is already installed. Skipping..."
else
    echo "📦 Installing cmake..."
    yay -S --noconfirm --needed cmake
fi
