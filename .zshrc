# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

alias vi="nvim"
alias hs="ssh ben@benhp.gemcity.net"

export EDITOR="nvim"
export TERM="screen-256color"

ulimit -n 4864

# Completion
autoload -Uz compinit && compinit

# Activate mise if present. Resolved via PATH so it works whether installed by
# Homebrew or the script; guarded so the shell doesn't error before it's installed.
command -v mise >/dev/null && eval "$(mise activate zsh)"

# Machine-specific overrides (PATH, work aliases, secrets). Not tracked in the
# dotfiles repo — create this file per-machine.
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
