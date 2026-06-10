#!/usr/bin/env bash
#
# bootstrap.sh — set up this machine from the dotfiles repo.
#
# Installs Homebrew (if missing), installs everything in the Brewfile,
# installs Claude Code, then symlinks config files into place.
#
# Safe to re-run: existing correct symlinks are left alone.

set -euo pipefail

# Resolve the absolute path to this dotfiles directory (where this script lives).
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ---------------------------------------------------------------------------
# Pretty status output
# ---------------------------------------------------------------------------
info()    { printf '\033[1;34m==>\033[0m %s\n' "$1"; }
success() { printf '\033[1;32m  ✓\033[0m %s\n' "$1"; }
warn()    { printf '\033[1;33m  !\033[0m %s\n' "$1"; }

# ---------------------------------------------------------------------------
# Homebrew
# ---------------------------------------------------------------------------
install_homebrew() {
  if command -v brew >/dev/null 2>&1; then
    success "Homebrew already installed"
  else
    info "Installing Homebrew..."
    NONINTERACTIVE=1 /bin/bash -c \
      "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    success "Homebrew installed"
  fi

  # Make brew available in this script regardless of shell config / arch.
  if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"   # Apple Silicon
  elif [ -x /usr/local/bin/brew ]; then
    eval "$(/usr/local/bin/brew shellenv)"      # Intel
  fi
}

# ---------------------------------------------------------------------------
# Brewfile packages
# ---------------------------------------------------------------------------
install_brew_packages() {
  info "Installing packages from Brewfile..."
  brew bundle --file="$DOTFILES_DIR/Brewfile"
  success "Brew packages installed"
}

# ---------------------------------------------------------------------------
# Claude Code
# ---------------------------------------------------------------------------
install_claude_code() {
  if command -v claude >/dev/null 2>&1; then
    success "Claude Code already installed"
  else
    info "Installing Claude Code..."
    curl -fsSL https://claude.ai/install.sh | bash
    success "Claude Code installed"
  fi
}

# ---------------------------------------------------------------------------
# Symlinking
# ---------------------------------------------------------------------------
# link_file <source> <target>
# Creates a symlink at <target> pointing to <source>, backing up any existing
# real file and skipping if the correct link already exists.
link_file() {
  local src="$1" dst="$2"

  # Ensure the parent directory of the target exists.
  mkdir -p "$(dirname "$dst")"

  if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then
    success "$dst already linked"
    return
  fi

  if [ -e "$dst" ] || [ -L "$dst" ]; then
    warn "$dst exists — backing up to ${dst}.bak"
    mv "$dst" "${dst}.bak"
  fi

  ln -s "$src" "$dst"
  success "Linked $dst -> $src"
}

create_directories() {
  info "Creating config directories..."
  mkdir -p "$HOME/.config"
  mkdir -p "$HOME/.config/ghostty"
  success "Config directories ready"
}

symlink_dotfiles() {
  info "Symlinking dotfiles..."
  link_file "$DOTFILES_DIR/.zshrc"         "$HOME/.zshrc"
  link_file "$DOTFILES_DIR/.gitconfig"     "$HOME/.gitconfig"
  link_file "$DOTFILES_DIR/.tmux.conf"     "$HOME/.tmux.conf"
  link_file "$DOTFILES_DIR/ghostty/config" "$HOME/.config/ghostty/config"
  link_file "$DOTFILES_DIR/lazy-nvim-v2"   "$HOME/.config/nvim"
  link_file "$DOTFILES_DIR/starship/starship.toml" "$HOME/.config/starship.toml"
}

# ---------------------------------------------------------------------------
# tmux plugin manager (tpm)
# ---------------------------------------------------------------------------
# The .tmux.conf declares plugins and runs tpm, but tpm itself must be cloned
# first. Once present, tpm can install the remaining plugins non-interactively.
install_tpm() {
  local tpm_dir="$HOME/.tmux/plugins/tpm"

  if [ -d "$tpm_dir" ]; then
    success "tpm already installed"
  else
    info "Installing tmux plugin manager (tpm)..."
    git clone https://github.com/tmux-plugins/tpm "$tpm_dir"
    success "tpm installed"
  fi

  info "Installing tmux plugins..."
  "$tpm_dir/bin/install_plugins"
  success "tmux plugins installed"
}

# ---------------------------------------------------------------------------
# Rectangle window manager config
# ---------------------------------------------------------------------------
# Rectangle stores its settings (including custom keybindings) in the macOS
# preferences system, not a plain file — so we can't symlink it. Instead we
# load the repo's exported plist with `defaults import`, which writes through
# cfprefsd correctly. Rectangle is quit first so it doesn't overwrite the
# imported prefs from its in-memory cache when it exits.
configure_rectangle() {
  info "Configuring Rectangle..."
  osascript -e 'quit app "Rectangle"' >/dev/null 2>&1 || true
  defaults import com.knollsoft.Rectangle "$DOTFILES_DIR/rectangle/RectangleConfig.plist"
  success "Rectangle config imported"
  open -a Rectangle >/dev/null 2>&1 || true
}

# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------
main() {
  info "Bootstrapping dotfiles from $DOTFILES_DIR"
  install_homebrew
  install_brew_packages
  install_claude_code
  create_directories
  symlink_dotfiles
  install_tpm
  configure_rectangle
  info "Done! 🎉"
  warn "Grant Rectangle Accessibility access: System Settings > Privacy & Security > Accessibility"
}

main "$@"
