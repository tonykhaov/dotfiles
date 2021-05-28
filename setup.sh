#! /usr/bin/env bash

# SHELL SCRIPT TO SETUP A FRESH MAC OS INSTALL

# Install Homebrew
if ! command -v brew > /dev/null; then
  ruby -e "$(curl --location --fail --silent --show-error https://raw.githubusercontent.com/Homebrew/install/master/install)"
  export PATH="/usr/local/bin:$PATH"
  printf "export PATH=\"/usr/local/bin:$PATH\"\n" >> $HOME/.bash_profile
fi

# Homebrew formulae
brew install ffmpeg
brew install git
# brew install imagemagick
brew install mas # Mac App Store CLI
brew install nvm
brew install python
brew install yarn
brew install zsh

# Fonts
brew tap homebrew/cask-fonts 
brew install --cask font-jetbrains-mono

# Install the Mac App Store CLI (mas)
if ! command -v mas > /dev/null; then
  printf "ERROR: Mac App Store CLI (mas) not found.\n"
  printf "       Please ensure Homebrew and mas (i.e. brew install mas) have been installed first."
  exit 1
fi

# zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Accept Xcode license
sudo xcodebuild -license accept

# Install Node.js
nvm install node
nvm use default