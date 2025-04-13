#!/bin/bash

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Symlink .tmux.conf
ln -sf "$DOTFILES_DIR/tmux.conf" "$HOME/.tmux.conf"

# Symlink Neovim config
mkdir -p "$HOME/.config"
ln -sf "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"

echo "✅  Dotfiles installed!"
