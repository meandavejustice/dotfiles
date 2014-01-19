# Path to your oh-my-zsh configuration.
ZSH=~meandave/.oh-my-zsh
. ~/.shell/functions
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="sunrise"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias zshrc="vim ~/.zshrc"
alias spotify="osascript ~/Code/Projects/SpotifyControl/SpotifyControl.scpt"
alias itunes="~/Code/Projects/bash-itunes/itunes"
alias docs="~/docs.zsh"
alias vimrc="vim ~/.vimrc"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format
# plugins=(rails git textmate ruby lighthouse)
plugins=(git gitfast virtualenvwrapper vagrant pip osx npm node brew)

source $ZSH/oh-my-zsh.sh
# export ALTERNATE-EDITOR='vim'

# Customize to your needs...
# export PATH=/Applications/Emacs.app/Contents/MacOS/bin:$PATH
export PATH=/usr/local/tranquil/bin:$PATH
export PATH=/Users/meandave/.rvm/gems/ruby-2.9.3-p286/bin:$PATH
export PATH=/Users/meandave/.rvm/gems/ruby-1.9.3-p286@global/bin:$PATH
export PATH=/Users/meandave/.rvm/rubies/ruby-1.9.3-p286/bin:$PATH
export PATH=/Users/meandave/.rvm/bin:$PATH
export PATH=/usr/local/mysql/bin:$PATH
export PATH=/usr/local/Cellar/moc/2.5.0-beta1/bin:$PATH
export PATH=/usr/bin:$PATH
export PATH=/bin:$PATH
export PATH=/usr/sbin:$PATH
export PATH=/sbin:$PATH
export PATH=/Users/meandave/.rvm/bin:$PATH
export PATH=/usr/local/lib/node_modules/grunt:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/Users/meandave/Code/Projects/clojurescript:$PATH
