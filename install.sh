#!/bin/bash

set -e

DOTFILES_DIR="$HOME/dotfiles"
DOTFILES_REPO="https://github.com/aryankumar07/dotfiles.git"

# ─── Helpers ──────────────────────────────────────────────────────────────────

info()    { printf "\033[1;34m[INFO]\033[0m  %s\n" "$1"; }
success() { printf "\033[1;32m[OK]\033[0m    %s\n" "$1"; }
warn()    { printf "\033[1;33m[SKIP]\033[0m  %s\n" "$1"; }

command_exists() { command -v "$1" &>/dev/null; }

# ─── macOS: Xcode Command Line Tools ─────────────────────────────────────────

if [[ "$(uname)" == "Darwin" ]]; then
  if xcode-select -p &>/dev/null; then
    warn "Xcode CLI tools already installed"
  else
    info "Installing Xcode CLI tools..."
    xcode-select --install
    # Wait for install to finish before continuing
    until xcode-select -p &>/dev/null; do
      sleep 5
    done
    success "Xcode CLI tools installed"
  fi
else
  echo "This script is designed for macOS. Exiting."
  exit 1
fi

# ─── Clone dotfiles ──────────────────────────────────────────────────────────

if [ -d "$DOTFILES_DIR/.git" ]; then
  warn "Dotfiles repo already exists at $DOTFILES_DIR"
else
  info "Cloning dotfiles..."
  git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
  success "Dotfiles cloned"
fi

# ─── Homebrew ─────────────────────────────────────────────────────────────────

if command_exists brew; then
  warn "Homebrew already installed"
else
  info "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  success "Homebrew installed"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"
brew analytics off

# ─── Brew Bundle ──────────────────────────────────────────────────────────────

info "Running brew bundle (already-installed packages will be skipped)..."
brew bundle --file="$DOTFILES_DIR/Brewfile"
success "Brew bundle complete"

# ─── Stow dotfiles ───────────────────────────────────────────────────────────

if command_exists stow; then
  info "Stowing dotfiles..."
  cd "$DOTFILES_DIR"
  stow --adopt .
  # Reset any adopted changes so dotfiles repo stays clean
  git checkout .
  success "Dotfiles stowed"
else
  echo "Error: stow not found after brew bundle. Something went wrong."
  exit 1
fi

# ─── NVM (Node Version Manager) ──────────────────────────────────────────────

export NVM_DIR="$HOME/.nvm"

if [ -s "$NVM_DIR/nvm.sh" ]; then
  warn "nvm already installed"
else
  info "Installing nvm..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
  success "nvm installed"
fi

# Load nvm and install latest LTS node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

if command_exists node; then
  warn "Node.js already installed ($(node -v))"
else
  info "Installing Node.js LTS via nvm..."
  nvm install --lts
  success "Node.js installed ($(node -v))"
fi

# ─── Rust ─────────────────────────────────────────────────────────────────────

if command_exists rustc; then
  warn "Rust already installed ($(rustc --version))"
else
  info "Installing Rust via rustup..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  source "$HOME/.cargo/env"
  success "Rust installed"
fi

# ─── Neovim (build from source) ──────────────────────────────────────────────

if command_exists nvim; then
  warn "Neovim already installed ($(nvim --version | head -1))"
else
  info "Building Neovim from source..."
  NVIM_BUILD_DIR="/tmp/neovim-build"
  rm -rf "$NVIM_BUILD_DIR"
  mkdir -p "$NVIM_BUILD_DIR"
  git clone --depth 1 https://github.com/neovim/neovim "$NVIM_BUILD_DIR"
  cd "$NVIM_BUILD_DIR"
  make CMAKE_BUILD_TYPE=RelWithDebInfo
  sudo make install
  cd "$DOTFILES_DIR"
  rm -rf "$NVIM_BUILD_DIR"
  success "Neovim installed ($(nvim --version | head -1))"
fi

# ─── Claude CLI ───────────────────────────────────────────────────────────────

if command_exists claude; then
  warn "Claude CLI already installed ($(claude --version))"
else
  info "Installing Claude CLI..."
  curl -fsSL https://claude.ai/install.sh | bash
  success "Claude CLI installed"
fi

# ─── Tmux Plugin Manager (TPM) ───────────────────────────────────────────────

TPM_DIR="$HOME/.tmux/plugins/tpm"

if [ -d "$TPM_DIR" ]; then
  warn "TPM already installed"
else
  info "Installing Tmux Plugin Manager..."
  git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
  success "TPM installed — press prefix + I inside tmux to install plugins"
fi

# ─── Done ─────────────────────────────────────────────────────────────────────

echo ""
success "All done! Log out and back in (or restart) to finish setting up your shell."
echo "  - Open tmux and press prefix + I to install tmux plugins"
echo "  - Open nvim to let lazy.nvim install plugins automatically"
