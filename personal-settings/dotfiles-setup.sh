#!/bin/sh

set -e  # exit script if any command fails

ORIGINAL_DIR=$(pwd)
REPO_URL="https://github.com/lpopedv/dotfiles"
REPO_NAME="Dotfiles"

# List of dotfile modules to remove from ~/.config and restow automatically
MODULES=("nvim" "fish" "doom")

# Check if stow is installed
is_stow_installed() {
  pacman -Qi "stow" &> /dev/null
}

if ! is_stow_installed; then
  echo "Install stow first"
  return 1 2>/dev/null || exit 1
fi

cd ~

# Clone repository if it does not exist
if [ -d "$REPO_NAME" ]; then
  echo "Repository '$REPO_NAME' already exists. Skipping clone"
else
  git clone "$REPO_URL" "$REPO_NAME"
fi

# Ensure repository exists after clone
if [ ! -d "$REPO_NAME" ]; then
  echo "Failed to clone the repository"
  cd "$ORIGINAL_DIR"
  return 1 2>/dev/null || exit 1
fi

echo "Removing old configs…"
# Remove old configuration directories dynamically
for module in "${MODULES[@]}"; do
  rm -rf "$HOME/.config/$module"
done

echo "Applying stow…"
cd "$REPO_NAME"

# Stow each module
for module in "${MODULES[@]}"; do
  if [ -d "$module" ]; then
    echo "→ Stowing $module"
    stow "$module"
  else
    echo "⚠️  Skipping '$module' (folder not found)"
  fi
done

cd "$ORIGINAL_DIR"

echo "Done!"
