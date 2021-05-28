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
brew install imagemagick
brew install mas # Mac App Store CLI
brew install nvm
brew install python
brew install yarn
brew install zsh zsh-completions

# Install Homebrew Casks.
brew install --cask 1password
brew install --cask alfred
brew install --cask anki
# brew install --cask bettertouchtool
brew install --cask brave-browser
brew install --cask discord
brew install --cask docker
brew install --cask figma
# brew install --cask hazel
brew install --cask kap
brew install --cask qbittorrent
# brew install --cask maccy
# brew install --cask molotov
# brew install --cask muzzle
brew install --cask nordvpn
brew install --cask notion
# brew install --cask numi
brew install --cask rectangle
brew install --cask spotify
brew install --cask the-unarchiver
# brew install --cask transmit
# brew install --cask turbo-boost-switcher # Only for Intel chipsets
# brew install --cask typora
brew install --cask visual-studio-code
brew install --cask vlc

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