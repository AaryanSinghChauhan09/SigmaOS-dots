#!/usr/bin/env bash
set -euo pipefail

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

section() {
  echo -e "\n==> $1"
}

section "Installing SigmaOS dots..."
mkdir -p "$HOME/.config" "$HOME/.local/bin"
cp -rf "$SRC/config/." "$HOME/.config/"
if [ -d "$SRC/bin" ]; then
  cp -f "$SRC/bin/"* "$HOME/.local/bin/" 2>/dev/null || true
fi
for dir in "$SRC/config"/*/; do
  echo "✓ $(basename "$dir")"
done

section "Installing LazyVim..."
rm -rf ~/.config/nvim
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

section "Configuring shell..."
case "$(basename "$SHELL")" in
zsh)
  cat >"$HOME/.zshrc" <<'EOF'
# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# Load zsh options, keybindings, and completion
source ~/.config/shell/zoptions

# Load shared shell configuration (aliases, functions, environment, tool init)
source ~/.config/shell/all
EOF
  echo '. ~/.zshrc' >"$HOME/.zprofile"
  echo "✓ Zsh"
  ;;
bash)
  cat >"$HOME/.bashrc" <<'EOF'
# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# Load bash options, keybindings, and completion
source ~/.config/shell/all
EOF
  echo '. ~/.bashrc' >"$HOME/.bash_profile"
  ln -snf "$HOME/.config/shell/inputrc" "$HOME/.inputrc"
  echo "✓ Bash"
  ;;
fish)
  echo "✓ Fish (config installed to ~/.config/fish)"
  ;;
esac
