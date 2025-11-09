#!/bin/sh

if pacman -Q emacs &> /dev/null; then
    echo "✅ emacs is already installed. Skipping..."
else
    echo "📦 Installing emacs..."
    yay -S --noconfirm --needed emacs
fi
