export PATH="/usr/local/bin:$PATH"
export CLICOLOR=1
export JAVA_HOME=$(/usr/libexec/java_home)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion # Enable bash-completion

# Make mac warning go away
export BASH_SILENCE_DEPRECATION_WARNING=1

# Pyenv support
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Poetry
export PATH="$HOME/.poetry/bin:$PATH"

# Other python stuff
export PATH="$PATH:$HOME/.local/bin"
