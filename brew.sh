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
  brew install --cask 1password-cli
  brew install adobe-creative-cloud
  brew install --cask android-studio
  brew install aldente
  brew install alt-tab
  brew install amethyst
  brew install anki
  brew install awscli
  brew install bartender
  brew install calibre
  brew install discord
  brew install --cask docker
  brew install --cask dolphin
  brew install dropzone
  brew install figma
  brew install google-chrome
  brew install iina
  brew install imageoptim
  brew install logitech-options
  brew install pulumi
  brew install podman
  brew install podman-compose
  brew install --cask podman-desktop
  brew install qbittorrent
  brew install --cask mgba
  brew install monitorcontrol
  brew install nordvpn
  brew install notion
  brew install --cask raycast
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