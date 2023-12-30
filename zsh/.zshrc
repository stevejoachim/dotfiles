# Zsh configuration
#
# Use `brew` to install plugins and utilities:
#
# ```
# brew install \
#   zsh-completions \
#   zsh-autosuggestions \
#   zsh-syntax-highlighting \
#   zsh-history-substring-search \
#   powerlevel10k \
#   zoxide \
#   fzf \
#   exa
# ```

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Initialize pyenv.
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Configure history.
export HISTFILE=~/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000
setopt EXTENDED_HISTORY        # Add timestamps
setopt HIST_IGNORE_DUPS        # Ignore consecutive duplicates.
setopt HIST_FIND_NO_DUPS       # Search only returns unique commands.
setopt HIST_IGNORE_SPACE       # Ignore commands starting with space.
setopt INC_APPEND_HISTORY_TIME # Write a command to history when it finishes.
setopt HIST_VERIFY             # Show command before running it.
setopt HIST_EXPIRE_DUPS_FIRST  # Delete duplicates first when size is exceeded.


# Use emacs bindings, but enter vim editing mode with `jk`.
bindkey -e
bindkey jk vi-cmd-mode

# Zsh completion, syntax highlighting, history search, and autosuggestions.
FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# Initialize `z` autojump utility.
eval "$(zoxide init zsh)"

# Open command in editor with `<C-x><C-e>`.
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# Add aliases.
alias la='exa -la'
alias ll='exa -l'

# Set options.
setopt AUTO_CD    # Just type the directory name to cd somehwere.
setopt NO_CLOBBER # Must use `>|` to clobber instead of just `>`.

# `fzf` setup.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Initialize prompt. To customize, run `p10k configure` or edit ~/.p10k.zsh.
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
