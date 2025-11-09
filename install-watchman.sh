#!/bin/sh

if pacman -Q watchman &> /dev/null; then
    echo "✅ watchman is already installed. Skipping..."
else
    echo "📦 Installing watchman..."
    yay -S --noconfirm --needed watchman-bin
fi
