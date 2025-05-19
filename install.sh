#!/bin/bash

set -e

# Functions 

proceed() {
  read -p "$1 (y/n) : " flag
  if [[ "$flag" == "y" || "$flag" == "Y" ]]
  then
    echo "Proceed confirmed"
    return 0
  else
    echo "Sad to be canceled"
    exit 1
  fi
}

commandExists() {
  if ! command -v "$1" &> /dev/null; then
    echo "Error: $1 is not installed. Please install $1 and rerun the script."
    exit 1
  fi
}

buildNeoVimdependencies() {
  echo "Building dependencies"
  commandExists curl
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
  export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  echo "Done completed"
}

echo "🙏 Deep breaths, everything will (probably) be fine!"
echo ""

# Install xCode cli tools
echo "Checking if Working on macOS"
if [[ "$(uname)" == "Darwin" ]]; then
    echo "macOS detected..."
    if xcode-select -p &>/dev/null; then
        echo "Xcode already installed"
    else
        echo "Installing command line tools..."
        xcode-select --install
    fi
fi

commandExists git

# Clone the dotfiles repository if it doesn't exist
if [ ! -d "$HOME/dotfiles" ]; then
  echo "Cloning dotfiles repository..."
  if git clone https://github.com/aryankumar07/dotfiles.git "$HOME/dotfiles"; then
    echo "Cloned successfully. One more step completed. Voila!"
  else
    echo "Error: Failed to clone the repository."
    exit 1
  fi
fi

# Copy Brewfile if it exists
if [ -f "$HOME/dotfiles/Brewfile" ]; then
  echo "Copying Brewfile temporarily..."
  cp "$HOME/dotfiles/Brewfile" "$HOME"
else
  echo "Warning: Brewfile not found in the dotfiles repository."
fi

# Homebrew installation
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "Homebrew already installed"
fi

brew analytics off

commandExists brew

# Run brew bundle only if Brewfile exists
if [ -f "$HOME/Brewfile" ]; then
  echo "Running brew bundle..."
  brew bundle --file="$HOME/Brewfile"
else
  echo "Warning: No Brewfile found at $HOME"
fi

export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/curl/lib"
export CPPFLAGS="-I/opt/homebrew/opt/curl/include"

echo "Brew installation completed. Hold your seats just at the end of the script"

rm Brewfile

proceed "Do you want to install Neovim?"

buildNeoVimdependencies

commandExists make

mkdir -p /tmp/builds
cd /tmp/builds

if git clone https://github.com/neovim/neovim; then
  cd neovim
  make CMAKE_BUILD_TYPE=RelWithDebInfo
  sudo make install
  echo "Neovim has been installed"
else
  echo "Failed to clone Neovim repository"
  exit 1
fi

# come back to Home repo
cd "$HOME/dotfiles" || exit

commandExists stow

echo "Stowing dotfiles..."
stow .

echo ""
echo "🤯 It actually worked!"
echo "Log out and log back in (or just restart) to finish installing all ZSH features."
