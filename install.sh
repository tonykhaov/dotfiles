#! /usr/bin/env bash

# Install necessary packages and config files
chmod u+x ./setup.sh && ./setup.sh

# Change macOS settings
chmod u+x ./macos.sh && ./macos.sh

# mas.sh
chmod u+x ./mas.sh && ./mas.sh

# brew.sh
chmod u+x ./brew.sh && ./brew.sh

################################
# If you install them manually, make sure to have run mas.sh and brew.sh first

# Import vscode settings, snippets and keybindings
chmod u+x ./vscode.sh && ./vscode.sh

# Import alfred custom searches and workflows
chmod u+x ./alfred.sh && ./alfred.sh

# Install chrome extensions
chmod u+x ./chrome-extensions.sh && ./chrome-extensions.sh