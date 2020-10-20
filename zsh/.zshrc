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

# Initialize z (jump around) https://github.com/rupa/z/
. ~/.zprezto-contrib/z/z.sh

# Shortcut to love2d game framework
alias love="/Applications/love.app/Contents/MacOS/love"

# Pyenv setup
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Node version manager setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
