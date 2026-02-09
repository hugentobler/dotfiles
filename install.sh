#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$HOME/Developer/dotfiles"

# Codex config
mkdir -p "$HOME/.codex"
ln -sfn "$DOTFILES_DIR/codex/config.toml" "$HOME/.codex/config.toml"

# Zed config
mkdir -p "$HOME/.config/zed"
ln -sfn "$DOTFILES_DIR/zed/settings.json" "$HOME/.config/zed/settings.json"
ln -sfn "$DOTFILES_DIR/zed/keymap.json" "$HOME/.config/zed/keymap.json"
