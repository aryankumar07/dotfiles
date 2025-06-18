# Starship 
eval "$(starship init zsh)"
export STARSHIP_CONFIG=$HOME/.config/starship/.config/starship.toml

# curl path
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/curl/lib"
export CPPFLAGS="-I/opt/homebrew/opt/curl/include"

# nvm (node version manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion



# NOTE : FZF

source <(fzf --zsh)

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git "
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

export FZF_DEFAULT_OPTS="--height 50% --layout=default --border --color=hl:#2dd4bf"

# Setup fzf previews
export FZF_CTRL_T_OPTS="--preview 'bat --color=always -n --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --icons=always --tree --color=always {} | head -200'"

# fzf preview for tmux
export FZF_TMUX_OPTS=" -p90%,70% "  

source ~/scripts/fzf-git.sh/fzf-git.sh


# NOTE: Zoxide
eval "$(zoxide init zsh)"

source ~/scripts/zoxide/z.sh


# Next level of an ls 
# options :  --no-filesize --no-time --no-permissions 
# alias ls="eza --no-filesize --grid --color=always --icons=always --no-user" 
source ~/scripts/eza/eza.sh


# git aliases
alias gt="git"
alias ga="git add ."
alias gs="git status -s"
alias gc='git commit'
alias gl='git log --graph --all --pretty=format:"%C(magenta)%h %C(white) %an  %ar%C(blue)  %D%n%s%n"'
alias gh-create='gh repo create --private --source=. --remote=origin && git push -u --all && gh browse'
alias gp="git push"
alias gu="git pull"
alias gb="git branch"
alias gi="git init"
alias gcl="git clone"
alias gcd="git clone --depth 1"
alias gd='git diff --output-indicator-new=" " --output-indicator-old=" "'
alias gap='ga --patch'




# other Aliases shortcuts
alias c="clear"
alias e="exit"
alias nv="nvim"
alias src="source .zshrc"
alias ff="yazi"



# alias for switching node
swn() {
  unset -f nvm
  export PATH="/usr/local/bin:$(echo $PATH | tr ':' '\n' | grep -v '.nvm' | tr '\n' ':')"
  hash -r
  which node
  node -v
}
