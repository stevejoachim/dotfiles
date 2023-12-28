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

# Initialize `z` autojump utility.
eval "$(zoxide init zsh)"

# Enter vim editing mode with `jk`.
bindkey jk vi-cmd-mode

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
