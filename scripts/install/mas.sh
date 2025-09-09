#! /usr/bin/env bash

echo "Install mas cli"
brew install mas

echo "Install Mac App Store apps"
mas install 409183694 # Keynote
mas install 409203825 # Numbers
mas install 409201541 # Pages
mas install 497799835 # Xcode

mas upgrade