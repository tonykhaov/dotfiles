# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export LC_CTYPE="en_US.UTF-8"

ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

UPDATE_ZSH_DAYS=3
DISABLE_AUTO_UPDATE="false"
DISABLE_UPDATE_PROMPT="true" # AUTO UPDATE OH-MY-ZSH

# run nvm use on every project
NVM_AUTO_USE=true

# Disable brew auto update when installing
HOMEBREW_NO_AUTO_UPDATE=1

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

ZSH_DISABLE_COMPFIX="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# PLUGINS
plugins=(z zsh-nvm git zsh-autosuggestions zsh-syntax-highlighting you-should-use)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# ALIASES
alias ni="npm install"
alias nrs="npm run start"
alias nrd="npm run dev"
alias nrt="npm run test"
alias nrtw="npm run test:watch"
alias ncu="npx npm-check-updates"

alias yi="yarn install"
alias yd="yarn dev"
alias ys="yarn start"
alias yt="yarn test"
alias ytw="yarn test:watch"

alias ytmp4="youtube-dl -f mp4"
alias mergepdf="gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=merged.pdf"
alias splitpdf="convert -density 150" # input.pdf output.jpg // increase density if this is too blur
# to convert an image to pdf, use `convert input1.jpgg input2.jpg output.pdf`

alias backup="rsync --exclude='node_modules' --exclude='.next' --exclude='.DS_Store' -avzP"
backup_hdd() {
  # Delete old backup
  rm -rf /Volumes/Old_Backup
  # Save last backup
  mv /Volumes/Tony/Backup /Volumes/Tony/Old_Backup
  # Create new backup
  mkdir -p /Volumes/Tony/Backup
  backup ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/Documents/. /Volumes/Tony/Backup
  backup ~/Documents/Coding ~/Documents/Editing /Volumes/Tony/Backup
}

update() {
  brew update
  brew upgrade
  mas upgrade
}

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh