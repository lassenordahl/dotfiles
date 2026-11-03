# Shared zsh config (macOS + WSL). Machine-specific stuff goes in ~/.zshrc.local

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="awesomepanda"
source $ZSH/oh-my-zsh.sh

# Homebrew (macOS or Linuxbrew, whichever exists)
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Aliases
alias dd="cd ~/dev/derailed"
alias pf="git push -f"
alias commit="git add . && git commit -m progress"
alias amend="git add . && git commit --amend"
alias s="git status"
alias cwd="cd ~/dev/cmd && pnpm tui"
alias edit="vim ~/.zshrc"
alias load="source ~/.zshrc"
alias zshrc="cat ~/.zshrc"
alias claude="claude --dangerously-skip-permissions"
alias deploy-web="cd ~/dev/lassenordahl.com/apps/web && npm run build && wrangler pages deploy public --project-name lassenordahl-web --branch main"
alias dotsync="git -C ~/dotfiles pull --rebase && source ~/.zshrc"

# pipx / local bins
export PATH="$PATH:$HOME/.local/bin"

# Unity CLI (only if installed)
[[ -f "$HOME/.unity/env" ]] && . "$HOME/.unity/env"

# Machine-specific overrides (not tracked)
[[ -f "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"
