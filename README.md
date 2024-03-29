Hey this is my MacOS dotfiles!

## Table of contents

- [Installation](#installation)
- [Before reseting the macbook](#before-reseting-the-macbook)
- [My folder structure](#my-folder-structure)

---

## Installation

1. Sign in with Mac App Store GUI first!

2. Open your terminal and run this script: (this will clone the repo and automatically start the setup)

```
mkdir -p ~/Documents/Coding && git clone https://github.com/tonykhaov/dotfiles.git ~/Documents/Coding/dotfiles && cd ~/Documents/Coding/dotfiles && chmod +x ./install.sh && ./install.sh
```

**_You must wait for install.sh script to be completed to carry on with the manual installation_**

4. Terminal:

- Open Terminal.app > Preferences > Import > Dracula.terminal
- Select Dracula theme > Set as default > Change font to JetBrains Mono and 18 for font size

5. General Settings

- Keyboards

  - Modifier Keys > Caps Lock: Escape
  - Fn touch > Show emoji and symbols
  - Disable Spotlight shortcut > Shortcuts > Spotlight
  - Shortcuts > Screenshots > Copy picture of X to the clipboard: Cmd + Shift + 3

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

7. Import browser bookmarks

- chrome://bookmarks/ > Import bookmarks .html file from the hard drive

8. Imports OneTab urls

- chrome-extension://chphlpgkkbolifaimnlloiipkdnihall/import-export.html > copy the urls from Apple Notes

9. Install Anki add-ons

- Advanced Browser: **874215009**
- Fastbarwith nightmode support **46611790**
- Large and Colorful Buttons **1829090218**
- Review Heatmap: [download link](https://github.com/glutanimate/review-heatmap/releases)

10. Things 3

- Disabled Quick Entry shortcut

11. Important files

- Transfer them from your hard drive to `~/Documents`

12. Chrome

- Set downloads location to `/private/tmp`

13. Raycast

- cmd + space > Import Settings & Data > hit enter > select the .rayconfig file

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
