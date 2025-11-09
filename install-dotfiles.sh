#!/bin/sh

ORIGINAL_DIR=$(pwd)
REPO_URL="https://github.com/lpopedv/dotfiles"
REPO_NAME="Dotfiles"

is_stow_installed() {
  pacman -Qi "stow" &> /dev/null
}

if ! is_stow_installed; then
  echo "Install stow first"
  return 1
fi

cd ~

# Check if the repository already exists
if [ -d "$REPO_NAME" ]; then
  echo "Repository '$REPO_NAME' already exists. Skipping clone"
else
  git clone "$REPO_URL" Dotfiles
fi

# Check if the clone was successful
if [ $? -eq 0 ]; then
  echo "Removing old configs"
  rm -rf ~/.config/nvim
  rm -rf ~/.config/fish

  cd "$REPO_NAME"

  stow nvim
  stow fish
else
  echo "Failed to clone the repository"
  cd "$ORIGINAL_DIR"
  return 1
fi

cd "$ORIGINAL_DIR"
