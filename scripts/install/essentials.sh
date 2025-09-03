#!/usr/bin/env bash

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Set computer name with different formats
set_computer_name() {
    echo -e "${BLUE}Setting computer name...${NC}"
    
    read -p "Enter your full name (First Last) [Tony Khaov]: " full_name
    full_name=${full_name:-"Tony Khaov"}
    
    # Extract first and last name
    local first_name=$(echo "$full_name" | awk '{print $1}')
    local last_name=$(echo "$full_name" | awk '{print $2}')
    
    # Create abbreviated hostname format: mbp-t-k
    local first_initial=$(echo "$first_name" | cut -c1 | tr '[:upper:]' '[:lower:]')
    local last_initial=$(echo "$last_name" | cut -c1 | tr '[:upper:]' '[:lower:]')
    local abbreviated_name="mbp-${first_initial}-${last_initial}"
    
    echo -e "${YELLOW}Computer Name (display): ${full_name}${NC}"
    echo -e "${YELLOW}Host/LocalHost Name (network): ${abbreviated_name}${NC}"
    
    # Set different names for different purposes
    sudo scutil --set ComputerName "$full_name"
    sudo scutil --set HostName "$abbreviated_name"
    sudo scutil --set LocalHostName "$abbreviated_name"
    dscacheutil -flushcache
    
    echo -e "${GREEN}✓ Computer name configured:${NC}"
    echo -e "  ComputerName: $full_name"
    echo -e "  HostName/LocalHostName: $abbreviated_name"
}

# Install Homebrew if not present
install_homebrew() {
    if command_exists brew; then
        echo -e "${YELLOW}Homebrew already installed, updating...${NC}"
        brew update
        return
    fi
    
    echo -e "${BLUE}Installing Homebrew...${NC}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    echo -e "${BLUE}Setting up Homebrew PATH...${NC}"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
    
    echo -e "${GREEN}✓ Homebrew installed${NC}"
}

# Install essential development tools
install_dev_tools() {
    echo -e "${BLUE}Installing essential development tools...${NC}"
    
    local tools=("git" "python")
    
    for tool in "${tools[@]}"; do
        echo "Installing $tool..."
        brew install "$tool"
    done
    
    echo -e "${GREEN}✓ Development tools installed${NC}"
}

# Install JetBrains Mono font
install_jetbrains_font() {
    echo -e "${BLUE}Installing JetBrains Mono font...${NC}"
    
    brew tap homebrew/cask-fonts
    brew install --cask font-jetbrains-mono
    
    echo -e "${GREEN}✓ JetBrains Mono font installed${NC}"
}

# Install Node.js via Volta
install_node_volta() {
    if command_exists volta; then
        echo -e "${YELLOW}Volta already installed${NC}"
    else
        echo -e "${BLUE}Installing Volta (Node.js manager)...${NC}"
        curl https://get.volta.sh | bash
        source "$HOME/.zshrc" 2>/dev/null || true
    fi
    
    echo -e "${BLUE}Installing Node.js...${NC}"
    volta install node
    
    echo -e "${GREEN}✓ Node.js installed via Volta: $(node -v)${NC}"
}

# Install JavaScript runtimes and tools
install_js_tools() {
    echo -e "${BLUE}Installing JavaScript tools...${NC}"
    
    # Install ni (package manager helper)
    echo "Installing ni..."
    npm install -g @antfu/ni
    
    # Install alternative runtimes
    echo "Installing Deno..."
    brew install deno
    
    echo "Installing Bun..."
    brew tap oven-sh/bun
    brew install bun
    
    # Install package managers
    echo "Installing Yarn and pnpm..."
    brew install yarn pnpm
    
    echo -e "${GREEN}✓ JavaScript tools installed${NC}"
}

# Install additional development tools
install_additional_tools() {
    echo -e "${BLUE}Installing additional development tools...${NC}"
    
    # Neovim dependencies
    echo "Installing Neovim dependencies..."
    brew install neovim fzf ripgrep lazygit
    
    # Terminal
    echo "Installing Kitty terminal..."
    brew install --cask kitty
    
    # SST OpenCode
    echo "Installing SST OpenCode..."
    brew install sst/tap/opencode
    
    echo -e "${GREEN}✓ Additional tools installed${NC}"
}

# Generate SSH key for GitHub
generate_ssh_key() {
    if [[ -f "$HOME/.ssh/id_ed25519" ]]; then
        echo -e "${YELLOW}SSH key already exists at ~/.ssh/id_ed25519${NC}"
        return
    fi
    
    echo -e "${BLUE}Generating SSH key for GitHub...${NC}"
    
    read -p "Enter your email for SSH key [tony.khaov@gmail.com]: " git_email
    git_email=${git_email:-tony.khaov@gmail.com}
    
    # Create .ssh directory if it doesn't exist
    mkdir -p ~/.ssh
    
    # Generate SSH key
    ssh-keygen -t ed25519 -C "$git_email" -f ~/.ssh/id_ed25519 -N ""
    
    # Start ssh-agent and add key
    eval "$(ssh-agent -s)"
    
    # Create SSH config
    cat > ~/.ssh/config << EOF
Host *
    AddKeysToAgent yes
    UseKeychain yes
    IdentityFile ~/.ssh/id_ed25519
EOF
    
    # Add key to ssh-agent
    ssh-add --apple-use-keychain ~/.ssh/id_ed25519
    
    echo -e "${GREEN}✓ SSH key generated${NC}"
    echo -e "${YELLOW}📋 Copy your public key to GitHub:${NC}"
    echo -e "${BLUE}pbcopy < ~/.ssh/id_ed25519.pub${NC}"
    echo ""
    echo -e "${YELLOW}Then paste it at: https://github.com/settings/ssh/new${NC}"
}

main() {
    echo -e "${GREEN}"
    echo "  ███████ ███████ ███████ ███████ ███    ██ ████████ ██  █████  ██      ███████"
    echo "  ██      ██      ██      ██      ████   ██    ██    ██ ██   ██ ██      ██     "
    echo "  █████   ███████ ███████ █████   ██ ██  ██    ██    ██ ███████ ██      ███████"
    echo "  ██           ██      ██ ██      ██  ██ ██    ██    ██ ██   ██ ██           ██"
    echo "  ███████ ███████ ███████ ███████ ██   ████    ██    ██ ██   ██ ███████ ███████"
    echo -e "${NC}"
    echo -e "${BLUE}Installing essential tools for macOS development setup${NC}"
    echo ""
    
    set_computer_name
    install_homebrew
    install_dev_tools
    install_jetbrains_font
    install_node_volta
    install_js_tools
    install_additional_tools
    generate_ssh_key
    
    echo ""
    echo -e "${GREEN}🎉 Essential tools installation completed!${NC}"
    echo ""
    echo -e "${YELLOW}Next steps:${NC}"
    echo "  1. Add your SSH key to GitHub"
    echo "  2. Restart your terminal or run: source ~/.zshrc"
    echo "  3. Continue with the rest of the setup process"
}

main "$@"
