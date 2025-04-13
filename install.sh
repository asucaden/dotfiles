#!/bin/bash

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_COUNT=0

make_versioned_backup() {
  local target="$1"

  # Don't back up symlinks
  if [ -L "$target" ]; then
    return
  fi

  local i=0
  local backup="${target}.bak"
  while [ -e "$backup" ]; do
    i=$((i + 1))
    backup="${target}.bak.$i"
  done

  echo "⚠️ Backing up $target to $backup"
  mv "$target" "$backup"
  BACKUP_COUNT=$((BACKUP_COUNT + 1))
}

backup_and_symlink() {
  local src="$1"
  local target="$2"

  if [ -e "$target" ]; then
    make_versioned_backup "$target"
  fi

  ln -sf "$src" "$target"
  echo "✅ Linked $target → $src"
}

# Set up files
backup_and_symlink "$DOTFILES_DIR/tmux.conf" "$HOME/.tmux.conf"

mkdir -p "$HOME/.config"
backup_and_symlink "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"

# Final message
echo ""
if [ "$BACKUP_COUNT" -gt 0 ]; then
  echo "🧠 Note: $BACKUP_COUNT backup(s) were created."
  echo "   Files were backed up as .bak, .bak.1, etc. out of caution."
  echo "   If you're happy with your dotfiles, feel free to delete old backups manually:"
  echo "   find ~ -name '*.bak*' -print"
fi

echo "🎉 Dotfiles installed safely!"
