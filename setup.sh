#!/usr/bin/env bash

set_computer_name() {
  read -p "Enter name: [tonykhaov]" name
  name=${name:-tonykhaov}
  sudo scutil --set HostName $name
  sudo scutil --set LocalHostName $name
  sudo scutil --set ComputerName $name
  dscacheutil -flushcache
  echo "Computer name changed to ${name}"
}

install_rosetta() {
  echo "Install rosetta"
  softwareupdate --install-rosetta
}

install_homebrew() {
  echo "Install Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo "Set brew PATH"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/tonykhaov/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
}

install_main_brew_dependencies() {
  echo "Install git, python"
  brew install git
  brew install python
}

install_node_nvm() {
  echo "Uninstall node"
  brew uninstall --ignore-dependencies node
  brew uninstall --force node
  echo "Install node"
  mkdir -p ~/.nvm
  source $(brew --prefix nvm)/nvm.sh
  nvm install node
  nvm use node
}

install_jetbrains_font() {
  echo "Install Jetbrains Mono Font"
  brew tap homebrew/cask-fonts 
  brew install font-jetbrains-mono
}

import_vim_git_configs() {
  echo "Import vim config"
  rm -rf ~/.vimrc
  ln -s ~/Documents/Coding/dotfiles/.vimrc ~/.vimrc
  echo "Import git config"
  rm -rf ~/.gitconfig
  ln -s ~/Documents/Coding/dotfiles/.gitconfig ~/.gitconfig
}

import_stock_and_lab_folders() {
  echo "Import Lab dir inside ~/Documents"
  ln -s ~/Documents/Coding/dotfiles/Lab ~/Documents/Coding/Lab
  echo "Import Stock dir inside ~/Documents/Coding"
  ln -s ~/Documents/Coding/dotfiles/Stock ~/Documents/Stock
}


import_youtubedl_config() {
  echo "Import youtube-dl config"
  mkdir -p ~/.config 
  ln -s ~/Documents/Coding/dotfiles/youtube-dl ~/.config/youtube-dl
}

install_npm_check_updates() {
  echo "Install yarn"
  brew install yarn
  echo "Install npm-check-updates"
  yarn global add npm-check-updates
}


generate_ssh_key() {
  echo "Generating a new SSH key for GitHub"
  read -p "Enter git email: [tony.khaov@gmail.com]" git_email
  git_email=${git_email:-tony.khaov@gmail.com}
  ssh-keygen -t ed25519 -C "${git_email}" -f ~/.ssh/id_ed25519
  eval "$(ssh-agent -s)"
  echo "Host *\n AddKeysToAgent yes\n UseKeychain yes\n IdentityFile ~/.ssh/id_ed25519" | tee ~/.ssh/config
  ssh-add --apple-use-keychain ~/.ssh/id_ed25519
  echo "run 'pbcopy < ~/.ssh/id_ed25519.pub' and paste that into GitHub"
}

main() {
  set_computer_name
  install_homebrew
  install_main_brew_dependencies
  install_node_nvm
  install_jetbrains_font
  import_vim_git_configs
  import_stock_and_lab_folders
  import_youtubedl_config
  install_npm_check_updates
  generate_ssh_key
}

main