#!/bin/sh

if pacman -Q stow &> /dev/null; then
    echo "✅ stow is already installed. Skipping..."
else
    echo "📦 Installing stow..."
    yay -S --noconfirm --needed stow
fi
