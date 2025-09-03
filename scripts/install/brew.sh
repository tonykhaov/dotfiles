#! /usr/bin/env bash

install_additional_homebrew_formulaes() {
  echo "Install additional Homebrew formulaes"
  brew install ffmpeg
  brew install gs
  brew install jq
  brew install imagemagick
  brew install youtube-dl
  brew install trash
  brew install git-delta
}

load_third_party_cask_drivers() {
  echo "Load third party cask drivers"
  brew tap homebrew/cask-drivers
}

install_homebrew_cask_formulaes() {
  echo "Install Homebrew cask formulaes"
  brew install 1password
  brew install --cask android-studio
  brew install alt-tab
  brew install amethyst
  brew install anki
  brew install bartender
  brew install calibre
  brew install colima
  brew install discord
  brew install --cask docker
  brew install dropzone
  brew install figma
  brew install google-chrome
  brew install iina
  brew install imageoptim
  brew install --cask kap
  brew install logitech-options
  brew install pulumi
  brew install qbittorrent
  brew install monitorcontrol
  brew install notion
  brew install --cask raycast
  brew install soundsource
  brew install spotify
  brew install visual-studio-code
}

setup_docker() {
  echo "Setup Docker"
  colima start
}

install_fonts() {
  brew tap homebrew/cask-fonts
  brew install homebrew/cask-fonts/font-ubuntu
  brew install homebrew/cask-fonts/font-poppins
  brew install homebrew/cask-fonts/font-open-sans
  brew install homebrew/cask-fonts/font-roboto
  brew install homebrew/cask-fonts/font-inter
  brew install homebrew/cask-fonts/font-lato
  brew install homebrew/cask-fonts/font-noto-sans
}

install_fzf() {
  brew install fzf
  $(brew --prefix)/opt/fzf/install --all --no-bash --no-fish
}

main() {
  install_additional_homebrew_formulaes
  load_third_party_cask_drivers
  install_homebrew_cask_formulaes
  setup_docker
  install_fzf
}

main