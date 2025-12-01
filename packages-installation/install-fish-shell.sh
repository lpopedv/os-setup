#!/bin/sh

if pacman -Q fish &> /dev/null; then
    echo "✅ fish is already installed. Skipping..."
else
    echo "📦 Installing fish..."
    yay -S --noconfirm --needed fish
fi
