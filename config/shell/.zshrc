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
plugins=(z ssh-agent git zsh-autosuggestions zsh-syntax-highlighting you-should-use)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# ALIASES
alias nid="ni -D"
alias nd="nr dev"
alias ns="nr start"
alias nb="nr build"
alias nt="nr test"
alias nw="nr watch"
alias ntw="nr test:watch"
alias nte="nr test:e2e"
alias ntew="nr test:e2e:watch"
alias nteh="nr test:e2e:headed"

alias ncu="npx npm-check-updates"

alias mergepdf="gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=merged.pdf"
alias splitpdf="convert -density 150" # input.pdf output.jpg // increase density if this is too blur
# to convert an image to pdf, use `convert input1.jpgg input2.jpg output.pdf`

update() {
  brew update
  brew upgrade
  mas upgrade
}

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export OpenMP_ROOT=$(brew --prefix)/opt/libomp


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if [ "$PWD" = "$HOME" ]; then
    cd ./Downloads
fi
