#!/usr/bin/env bash

# Install oh-my-zsh if not already installed
if [ ! -d ~/.oh-my-zsh ]; then
    echo "Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "oh-my-zsh is already installed."
fi

# Install z tool
echo "Installing z..."
brew install z

# Install zsh plugins if not already present
if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then
    echo "Installing zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
else
    echo "zsh-autosuggestions is already installed."
fi

if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
    echo "Installing zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
else
    echo "zsh-syntax-highlighting is already installed."
fi

if [ ! -d ~/.oh-my-zsh/custom/plugins/you-should-use ]; then
    echo "Installing you-should-use..."
    git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ~/.oh-my-zsh/custom/plugins/you-should-use
else
    echo "you-should-use is already installed."
fi

# Install zsh-completions for better completion
if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-completions ]; then
    echo "Installing zsh-completions..."
    git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
else
    echo "zsh-completions is already installed."
fi

echo "oh-my-zsh setup complete."