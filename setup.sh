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

install_ohmyzsh() {
  echo "Install oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

install_homebrew() {
  echo "Install Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo "Set brew PATH"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/tonykhaov/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
}

install_main_brew_dependencies() {
  echo "Install git, nvm, python, zsh & z"
  brew install git
  brew install nvm yarn
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
  echo "Import zsh config"
  rm -rf ~/.zshrc
  ln -s ~/Documents/Coding/dotfiles/.zshrc ~/.zshrc
  echo "Import vim config"
  rm -rf ~/.vimrc
  ln -s ~/Documents/Coding/dotfiles/.vimrc ~/.vimrc
  echo "Import git config"
  rm -rf ~/.gitconfig
  ln -s ~/Documents/Coding/dotfiles/.gitconfig ~/.gitconfig
  source ~/.zshrc
}

install_zsh_autosuggestions() {
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
  source ~/.zshrc
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
  ssh-add -K ~/.ssh/id_ed25519
  echo "run 'pbcopy < ~/.ssh/id_ed25519.pub' and paste that into GitHub"
}

main() {
  set_computer_name
  install_ohmyzsh
  install_homebrew
  install_main_brew_dependencies
  install_node_nvm
  install_jetbrains_font
  import_zsh_vim_git_configs
  install_zsh_autosuggestions
  import_stock_and_lab_folders
  import_youtubedl_config
  install_npm_check_updates
  generate_ssh_key
}

main