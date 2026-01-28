#!/usr/bin/env bash
set -euo pipefail

# Codex config
mkdir -p "$HOME/.codex"
ln -sfn "$HOME/Developer/dotfiles/codex/config.toml" "$HOME/.codex/config.toml"
