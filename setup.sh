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

install_ohmyzsh_and_homebrew() {
  echo "Install oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  echo "Install Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

install_essential_brew_dependencies() {
  echo "Install git, nvm, python, zsh & z"
  brew install git
  brew install nvm
  brew install python
  brew install zsh z
}

install_node_nvm() {
  echo "Install node"
  mkdir -p ~/.nvm
  nvm install node
  nvm use node
}

install_jetbrains_font() {
  echo "Install Jetbrains Mono Font"
  brew tap homebrew/cask-fonts 
  brew install --cask font-jetbrains-mono
}

import_zsh_vim_git_configs() {
  echo "Import zsh config, vim config & gitconfig"
  cp -f .zshrc ~/.zshrc
  echo `export ZSH="/Users/$name/.oh-my-zsh"` >> ~/.zshrc
  source ~/.zshrc
  cp -f .vimrc ~/.vimrc
  cp -f .gitconfig ~/.gitconfig
}


import_stock_and_lab_folders() {
  mkdir -p ~/Documents/Coding
  echo "Import Stock dir inside ~/Documents/Coding"
  cp -r ./Lab ~/Documents/Coding
  echo "Import Lab dir inside ~/Documents"
  cp -r ./Stock ~/Documents
}


import_youtubedl_config() {
  echo "Import youtube-dl config"
  mkdir -p ~/.config && cp -r ./youtube-dl ~/.config
}

install_npm_check_updates() {
  echo "Install npm-check-updates"
  yarn global add npm-check-updates
}


generate_ssh_key() {
  echo "Generating a new SSH key for GitHub"
  read -p "Enter git email: [tony.khaov@gmail.com]" git_email
  git_email=${git_email:-tonykhaov}
  ssh-keygen -t ed25519 -C "${git_email}" -f ~/.ssh/id_ed25519
  eval "$(ssh-agent -s)"
  echo "Host *\n AddKeysToAgent yes\n UseKeychain yes\n IdentityFile ~/.ssh/id_ed25519" | tee ~/.ssh/config
  ssh-add -K ~/.ssh/id_ed25519
  echo "run 'pbcopy < ~/.ssh/id_ed25519.pub' and paste that into GitHub"
}

main() {
  set_computer_name
  install_essential_brew_dependencies
  install_node_nvm
  install_jetbrains_font
  import_zsh_vim_git_configs
  import_stock_and_lab_folders
  import_youtubedl_config
  install_npm_check_updates
  generate_ssh_key
}

main