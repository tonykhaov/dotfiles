#! /usr/bin/env bash

install_additional_homebrew_formulaes() {
  echo "Install additional Homebrew formulaes"
  brew install ffmpeg 
  brew install gs 
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
  brew install adobe-creative-cloud
  brew install aldente
  brew install alfred
  brew install alt-tab
  brew install amethyst
  brew install anki
  brew install appcleaner
  brew install bartender
  brew install calibre
  brew install discord
  brew install docker
  brew install --cask dolphin
  brew install dropzone
  brew install figma
  brew install google-chrome
  brew install iina
  brew install imageoptim
  brew install logitech-options
  brew install qbittorrent
  brew install --cask mgba
  brew install monitorcontrol
  brew install nordvpn
  brew install notion
  brew install rectangle
  brew install soundsource
  brew install spotify
  brew install visual-studio-code
}

main() {
  install_additional_homebrew_formulaes
  load_third_party_cask_drivers
  install_homebrew_cask_formulaes
}

main