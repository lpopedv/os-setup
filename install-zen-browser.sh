#!/bin/sh

if pacman -Q zen-browser-bin &> /dev/null; then
    echo "✅ zen-browser-bin is already installed. Skipping..."
else
    echo "📦 Installing zen-browser-bin..."
    yay -S --noconfirm --needed zen-browser-bin
fi
