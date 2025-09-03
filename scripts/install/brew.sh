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
  brew install anki
  brew install bartender
  brew install calibre
  brew install discord
  brew install dropzone
  brew install figma
  brew install google-chrome
  brew install cap
  brew install logitech-options
  brew install monitorcontrol
  brew install notion
  brew install raycast
  brew install soundsource
  brew install spotify
  brew install visual-studio-code
  brew install orbstack
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

open_gui_applications() {
  echo "Opening GUI applications that need initial setup..."
  
  # Open OrbStack if it was installed
  if brew list --cask orbstack &>/dev/null; then
    echo "Opening OrbStack..."
    open -a OrbStack
  fi
  
  # Open other apps that need setup
  if brew list --cask raycast &>/dev/null; then
    echo "Opening Raycast..."
    open -a Raycast
  fi
}

main() {
  install_additional_homebrew_formulaes
  load_third_party_cask_drivers
  install_homebrew_cask_formulaes
  install_fzf
  open_gui_applications
}

main