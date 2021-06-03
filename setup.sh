#! /usr/bin/env bash

# SHELL SCRIPT TO SETUP A FRESH MAC OS INSTALL

# Install Homebrew
if ! command -v brew > /dev/null; then
  ruby -e "$(curl --location --fail --silent --show-error https://raw.githubusercontent.com/Homebrew/install/master/install)"
  export PATH="/usr/local/bin:$PATH"
  printf "export PATH=\"/usr/local/bin:$PATH\"\n" >> $HOME/.bash_profile
fi

# Homebrew formulae
brew install git
brew install mas # Mac App Store CLI
brew install nvm
brew install python
brew install zsh z

# Install Node.js
[ ! -d ~/.nvm ] && mkdir ~/.nvm
printf "export NVM_DIR="$HOME/.nvm" \n [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  \n [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"" >> $HOME/.bash_profile
source $HOME/.bash_profile
nvm install node
nvm use node

# Fonts
brew tap homebrew/cask-fonts 
brew install --cask font-jetbrains-mono

# Install the Mac App Store CLI (mas)
if ! command -v mas > /dev/null; then
  printf "ERROR: Mac App Store CLI (mas) not found.\n"
  printf "       Please ensure Homebrew and mas (i.e. brew install mas) have been installed first."
  exit 1
fi

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Accept Xcode license
sudo xcodebuild -license accept