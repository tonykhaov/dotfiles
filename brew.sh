#! /usr/bin/env bash

echo "Install additional Homebrew formulaes"
brew install ffmpeg gs imagemagick youtube-dl 
brew install trash
brew install git-delta
brew install deno

echo "Load third party cask drivers"
brew tap homebrew/cask-drivers

echo "Install Homebrew casks"
brew install --cask 1password
brew install --cask adobe-creative-cloud
brew install --cask aldente
brew install --cask alfred
brew install --cask alt-tab
brew install --cask anki
brew install --cask appcleaner
brew install --cask bartender
brew install --cask calibre
brew install --cask discord
brew install --cask docker
brew install --cask dropzone
brew install --cask figma
brew install --cask google-chrome
brew install --cask iina
brew install --cask imageoptim
brew install --cask logitech-options
brew install --cask qbittorrent
brew install --cask molotov
brew install --cask monitorcontrol
brew install --cask nordvpn
brew install --cask notion
brew install --cask postman
brew install --cask rectangle
brew install --cask soundsource
brew install --cask spotify
brew install --cask visual-studio-code