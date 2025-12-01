#!/bin/sh
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

log() {
    printf "\033[1;36m[SETUP]\033[0m %s\n" "$1"
}

log "Installing base packages..."
. "$SCRIPT_DIR/packages-installation/install-stow.sh"
. "$SCRIPT_DIR/packages-installation/install-asdf.sh"
. "$SCRIPT_DIR/packages-installation/install-fish-shell.sh"
. "$SCRIPT_DIR/packages-installation/install-cmake.sh"
. "$SCRIPT_DIR/packages-installation/install-watchman.sh"

log "Setting fish as default shell..."
. "$SCRIPT_DIR/shell/set-default-shell.sh"

log "Applying dotfiles..."
. "$SCRIPT_DIR/personal-settings/dotfiles-setup.sh"

log "Installing applications..."
. "$SCRIPT_DIR/packages-installation/install-ghostty.sh"
. "$SCRIPT_DIR/packages-installation/install-zen-browser.sh"
. "$SCRIPT_DIR/packages-installation/install-lazygit.sh"
. "$SCRIPT_DIR/packages-installation/install-direnv.sh"
. "$SCRIPT_DIR/packages-installation/install-emacs.sh"
. "$SCRIPT_DIR/packages-installation/install-claude-code.sh"
. "$SCRIPT_DIR/packages-installation/install-slack.sh"

log "Applying Hyprland configuration..."
. "$SCRIPT_DIR/hyprland-settings/hyprland-overrides.sh"
. "$SCRIPT_DIR/hyprland-settings/hypridle-overrides.sh"

log "✔ Setup completed successfully!"

