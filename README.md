# 🛠️ Caden's Dotfiles

Minimal, carefully-scoped dotfiles setup for portability and repeatable development environments.

Currently includes:

- `.tmux.conf` — ergonomic prefix (`Ctrl-a`), Vim-style pane movement, reduced escape delay
- `nvim/` — full Neovim config (uses LazyVim)
- `install.sh` — safe, versioned symlink installer

---

## 🚀 Installation

Clone and run the installer:

```bash
git clone https://github.com/cadenmidkiff/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

## 🧪 Optional: Add the `dev` alias

To open a tmux session with your preferred layout in the current directory, add this alias:

```bash
echo 'alias dev="~/dotfiles/scripts/dev"' >> ~/.zshrc
source ~/.zshrc
```
