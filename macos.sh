#! /usr/bin/env bash

# Show hidden files in the Finder
defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder