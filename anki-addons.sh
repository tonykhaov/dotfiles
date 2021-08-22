#! /usr/bin/env bash

echo "Import anki add-ons to Anki app folder"
[ ! -d ~/Library/Application Support/Anki2 ] && cp -r ./anki/addons21 ~/Library/Application Support/Anki2