# Local binaries (Claude Code, native installers) live here.
export PATH="$HOME/.local/bin:$PATH"

alias vi="nvim"
alias g="git"
alias hs="ssh ben@benhp.gemcity.net"

# eza — a modern ls with icons (Nerd Font), colors, and git status.
alias ls="eza --icons --group-directories-first"
alias ll="eza -l --icons --git --group-directories-first"   # long view + git column
alias la="eza -la --icons --git --group-directories-first"  # long + hidden files
alias lt="eza --tree --level=2 --icons"                     # tree view, 2 levels deep

export EDITOR="nvim"
export TERM="screen-256color"

ulimit -n 4864

# Completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'  # case-insensitive matching
setopt AUTO_MENU         # Tab cycles through matches (press Tab again for the next one)
setopt MENU_COMPLETE     # first Tab inserts the first match, then Tab cycles
unsetopt AUTO_LIST       # don't print the menu of options — just cycle inline
setopt COMPLETE_IN_WORD  # complete from the cursor, not just the end of the word

# Activate mise if present. Resolved via PATH so it works whether installed by
# Homebrew or the script; guarded so the shell doesn't error before it's installed.
command -v mise >/dev/null && eval "$(mise activate zsh)"

# Starship prompt. Guarded so machines without it don't error.
command -v starship >/dev/null && eval "$(starship init zsh)"

# zsh plugins via Homebrew. Guarded so non-brew hosts (remote servers) skip them.
if command -v brew >/dev/null; then
  BREW_PREFIX="$(brew --prefix)"
  [ -f "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && \
    source "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
  # syntax-highlighting must be sourced LAST to wrap the final ZLE widgets.
  [ -f "$BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && \
    source "$BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi
# Keys stay separated, so completion and suggestions never fight:
#   Tab → completion (first match, then cycle)
#   →   → accept the grey autosuggestion from history

# Machine-specific overrides (PATH, work aliases, secrets). Not tracked in the
# dotfiles repo — create this file per-machine.
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
