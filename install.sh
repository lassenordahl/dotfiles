#!/usr/bin/env bash
# Symlinks dotfiles into $HOME. Safe to re-run. Works on macOS and Linux/WSL.
set -euo pipefail
DIR="$(cd "$(dirname "$0")" && pwd)"

link() {
  local src="$DIR/$1" dst="$2"
  mkdir -p "$(dirname "$dst")"
  if [[ -e "$dst" && ! -L "$dst" ]]; then
    mv "$dst" "$dst.backup.$(date +%s)"
    echo "backed up $dst"
  fi
  ln -sfn "$src" "$dst"
  echo "linked $dst -> $src"
}

# oh-my-zsh
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

link zsh/.zshrc      "$HOME/.zshrc"
link git/.gitconfig  "$HOME/.gitconfig"
link git/ignore      "$HOME/.config/git/ignore"

touch "$HOME/.zshrc.local" "$HOME/.gitconfig.local"

if [[ "$(basename "${SHELL:-}")" != "zsh" ]] && command -v zsh >/dev/null; then
  echo "tip: make zsh your default shell with: chsh -s \"$(command -v zsh)\""
fi
echo "done. open a new shell or run: source ~/.zshrc"
