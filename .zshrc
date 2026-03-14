# Starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG=$HOME/.config/starship/.config/starship.toml



# Zoxide
eval "$(zoxide init zsh)"
source ~/scripts/zoxide/z.sh


# Eza
source ~/scripts/eza/eza.sh


# Git aliases
alias gt="git"
alias ga="git add ."
alias gs="git status -s"
alias gc='git commit'
alias gl='git log --graph --all --pretty=format:"%C(magenta)%h %C(white) %an  %ar%C(blue)  %D%n%s%n"'
alias glp='git --no-pager log --oneline --parents --graph'
alias gh-create='gh repo create --private --source=. --remote=origin && git push -u --all && gh browse'
alias gp="git push"
alias gu="git pull"
alias gb="git branch"
alias gi="git init"
alias gcl="git clone"
alias gcd="git clone --depth 1"
alias gd='git diff --output-indicator-new=" " --output-indicator-old=" "'
alias gap='ga --patch'


# General aliases
alias c="clear"
alias e="exit"
alias nv="nvim"
alias src="source .zshrc"
alias ff="yazi"

alias merge="~/scripts/mergerer/merge.sh"


# Node version switching
source ~/scripts/nvm-manger/index.sh

# Tmux
alias td="tmux detach"
alias tl="tmux ls"
source ~/scripts/tmux/index.sh
