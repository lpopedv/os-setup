#!/bin/sh

if pacman -Q ghostty &> /dev/null; then
    echo "✅ ghostty is already installed. Skipping..."
else
    echo "📦 Installing ghostty..."
    yay -S --noconfirm --needed ghostty
fi
