#! /usr/bin/env bash

# Show hidden files in the Finder
defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder

# Keyboard > Delay Until Repeat: Short
defaults write -g InitialKeyRepeat -int 15

# Keyboard > Key Repeat: Fast
defaults write -g KeyRepeat -int 2

# Keyboard > Text > Correct spelling automatically: False
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

