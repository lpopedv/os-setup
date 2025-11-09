#!/bin/sh

if pacman -Q lazygit &> /dev/null; then
    echo "✅ lazygit is already installed. Skipping..."
else
    echo "📦 Installing lazygit..."
    yay -S --noconfirm --needed lazygit
fi
