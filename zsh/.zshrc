# zmodload zsh/zprof
#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

#
# My Stuff
#

# Easily get to Vim command mode for faster editing
bindkey jk vi-cmd-mode

# Use ls-deluxe instead of ls
DISABLE_LS_COLORS="true"
alias ls='lsd'

# Shortcut to love2d game framework
alias love="/Applications/love.app/Contents/MacOS/love"

# Pyenv setup
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Lazy-load node version manager

init_nvm() {
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
}

nvm() {
    unset -f nvm
    init_nvm
    nvm "$@"
}

node() {
    unset -f node
    init_nvm
    node "$@"
}

npm() {
    unset -f npm
    init_nvm
    npm "$@"
}

npx() {
    unset -f npx
    init_nvm
    npx "$@"
}

# Vim needs node for Coc plugin, so made sure it is loaded before starting
alias vim="node -v >/dev/null && vim"

# Add Go directory to path
path+=$(go env GOPATH)/bin
export PATH

# Fix grep color
export GREP_COLOR="1;33"
export GREP_COLORS="mt=1;33"

# Bat configuration
export BAT_PAGER="less -g -i -M -R -S -w -#4 --window=4"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zprof
