#! /usr/bin/env bash

echo "Import anki add-ons to Anki app folder"
rm -rf ~/Library/Application\ Support/Anki2/addons21
ln -sf ~/Documents/Coding/dotfiles/anki/addons21 ~/Library/Application\ Support/Anki2/addons21