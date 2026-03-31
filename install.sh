#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# Zsh config
ln -sfn "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"

# Codex config
mkdir -p "$HOME/.codex"
ln -sfn "$DOTFILES_DIR/codex/config.toml" "$HOME/.codex/config.toml"

# Zed config
mkdir -p "$HOME/.config/zed"
ln -sfn "$DOTFILES_DIR/zed/settings.json" "$HOME/.config/zed/settings.json"
ln -sfn "$DOTFILES_DIR/zed/keymap.json" "$HOME/.config/zed/keymap.json"

# Pi agent config
mkdir -p "$HOME/.pi/agent"
ln -sfn "$DOTFILES_DIR/pi/agent/models.json" "$HOME/.pi/agent/models.json"
ln -sfn "$DOTFILES_DIR/pi/agent/settings.json" "$HOME/.pi/agent/settings.json"
