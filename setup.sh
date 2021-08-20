#! /usr/bin/env bash

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Homebrew
if ! command -v brew > /dev/null; then
  ruby -e "$(curl --location --fail --silent --show-error https://raw.githubusercontent.com/Homebrew/install/master/install)"
  export PATH="/usr/local/bin:$PATH"
  printf "export PATH=\"/usr/local/bin:$PATH\"\n" >> $HOME/.bash_profile
fi

# Homebrew important formulaes
brew install git
brew install nvm
brew install python
brew install zsh z

# Install Node.js
[ ! -d ~/.nvm ] && mkdir ~/.nvm
printf "export NVM_DIR="$HOME/.nvm" \n [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  \n [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"" >> $HOME/.bash_profile
source $HOME/.bash_profile
nvm install node
nvm use node

# Fonts
brew tap homebrew/cask-fonts 
brew install --cask font-jetbrains-mono

# Import zsh config
cp ./.zshrc ~/.zshrc
source ~/.zshrc

# Import vim config
cp .vimrc ~/.vimrc

# Import git config
cp ./.gitconfig ~/.gitconfig

# Generate new SSH key
echo "Generating a new SSH key for GitHub"
ssh-keygen -t ed25519 -C "tony.khaov@gmail.com" -f ~/.ssh/id_ed25519
eval "$(ssh-agent -s)"
touch ~/.ssh/config
echo "Host *\n AddKeysToAgent yes\n UseKeychain yes\n IdentityFile ~/.ssh/id_ed25519" | tee ~/.ssh/config
ssh-add -K ~/.ssh/id_ed25519
echo "run 'pbcopy < ~/.ssh/id_ed25519.pub' and paste that into GitHub"

# Copy /Stock and /Lab dir
[ ! -d ~/Documents/Coding ] && mkdir ~/Documents/Coding
cp -r ./Lab ~/Documents/Coding
cp -r ./Stock ~/Documents/Stock