#!/bin/sh

if pacman -Q asdf-vm &> /dev/null; then
    echo "✅ asdf-vm is already installed. Skipping..."
else
    echo "📦 Installing asdf-vm..."
    yay -S --noconfirm --needed asdf-vm
fi
