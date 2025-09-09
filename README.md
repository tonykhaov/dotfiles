Hey this is my MacOS dotfiles!

## Table of contents

- [Installation](#installation)
- [Structure](#structure)
- [Before reseting the macbook](#before-reseting-the-macbook)
- [My folder structure](#my-folder-structure)

---

## Installation

1. Sign in with Mac App Store GUI first!

2. Open your terminal and run this script: (this will clone the repo and automatically start the setup)

```bash
mkdir -p ~/Documents/Coding && git clone https://github.com/tonykhaov/dotfiles.git ~/Documents/Coding/dotfiles && cd ~/Documents/Coding/dotfiles && chmod +x ./bootstrap.sh && ./bootstrap.sh
```

**_The bootstrap script will handle the entire automated setup process and will prompt you for your git name and email
during setup_**

---

## Structure

```
dotfiles/
├── config/                    # All configuration files
│   ├── git/.gitconfig        # Git configuration
│   ├── shell/                # Shell configurations (.zshrc, .zprofile)
│   ├── vim/.vimrc           # Vim configuration
│   ├── kitty/               # Kitty terminal config
│   ├── vscode/              # VS Code settings, keybindings, snippets
├── scripts/                  # Installation & setup scripts
│   ├── install/             # Initial setup (brew, apps, fonts)
│   ├── config/              # Configuration scripts (symlinks, vscode, etc.)
│   └── utils/               # Utility scripts
├── resources/               # Static resources
│   └── stock/              # Stock files for new setups
├── docs/                   # Documentation
├── bootstrap.sh           # Main entry point for setup
└── README.md
```

5. General Settings

- Keyboards

  - Modifier Keys > Caps Lock: Escape

- Trackpad

  - Silent clicking: Checked
  - Tracking speed: Fast

- Finder

  - Show view options > Text size: 14
  - Show view options > Icon size: 1/2
  - Show view options > Sort By: Name

- Notes

  - Preferences > Default text size: 4/5

- Security
  - Firewall: Turn on

6. 1Password

- Keyboard Shortcuts > Remove Fill Login or Show 1Password shortcut

12. Chrome

- Set downloads location to `/private/tmp`

---

## Before reseting the Macbook

You need to export these things:

1. Browser bookmarks

- chrome://bookmarks/ > Export bookmarks and store it in a hard drive

2. OneTab

- chrome-extension://chphlpgkkbolifaimnlloiipkdnihall/import-export.html > copy export urls > save them in Apple Notes

3. Important files

- Transfer `~/Documents` to a hard drive

---

## My folder structure

- `/private/tmp`: temporary folder where files are first downloaded. If they are important I process them, rename them
  and move them to my iCloud `Documents` folder. Otherwise, they will be automatically deleted.
- `~/Documents`: personal folder where important files are stored.
