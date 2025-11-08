# OS Setup

Automated installation scripts for setting up my Arch Linux development environment with Hyprland.

## Overview

This repository contains shell scripts to automate the installation and configuration of my preferred tools and applications on a fresh Arch Linux system running the Omarchy Hyprland setup.

## What Gets Installed

- **Shell**: Fish shell (set as default)
- **Terminal**: Ghostty
- **Browser**: Zen Browser
- **Version Manager**: asdf
- **Dotfiles Manager**: GNU Stow
- **Development Tools**:
  - Lazygit
  - Claude Code
- **Window Manager**: Hyprland with custom overrides

## Usage

Run the master installation script:

```sh
chmod +x master-installation.sh
./master-installation.sh
```

This will execute all installation scripts in the correct order.

## Individual Scripts

You can also run individual scripts if you only need specific tools:

- `./install-stow.sh` - Install GNU Stow
- `./install-asdf.sh` - Install asdf version manager
- `./install-fish-shell.sh` - Install Fish shell
- `./set-shell.sh` - Set Fish as default shell
- `./install-dotfiles.sh` - Install dotfiles using Stow
- `./install-ghostty.sh` - Install Ghostty terminal
- `./install-zen-browser.sh` - Install Zen Browser
- `./install-lazygit.sh` - Install Lazygit
- `./install-claude-code.sh` - Install Claude Code
- `./install-hyprland-overrides.sh` - Apply Hyprland configuration overrides

## Hyprland Configuration

The `hyprland-overrides.conf` file contains custom configurations including:

- Brazilian ABNT2 keyboard layout
- Caps Lock remapped to Control
- Ghostty set as default terminal
- Picture-in-Picture window rules

## Requirements

- Arch Linux
- Omarchy (or compatible Hyprland setup)
- Internet connection for package downloads

## Notes

After running the setup, you may need to log out and log back in for all changes to take effect, especially the default shell change.
