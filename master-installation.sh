#!/bin/sh

# Install base tools and dependencies
. ./install-stow.sh
. ./install-asdf.sh
. ./install-fish-shell.sh
. ./install-cmake.sh
. ./install-watchman.sh

# Set fish as default shell
. ./set-shell.sh

# Install dotfiles
. ./install-dotfiles.sh

# Install applications
. ./install-ghostty.sh
. ./install-zen-browser.sh
. ./install-lazygit.sh
. ./install-direnv.sh
. ./install-emacs.sh
. ./install-claude-code.sh
. ./install-slack.sh

# Install and configure Hyprland
. ./install-hyprland-overrides.sh
. ./install-hypridle-overrides.sh
