
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/aryankumar/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/aryankumar/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/aryankumar/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/aryankumar/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

alias gpp="g++ -std=c++11"
alias chrome="open -a 'Google Chrome'"
alias t1="tree -L 1 -D"
alias t2="tree -L 2 -D"
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"

export PATH="$PATH:/Users/aryankumar/Tools/flutter/bin"
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH=${PATH}:/usr/local/mysql/bin/

export PATH="${PATH}:/Users/aryankumar/.local/bin"

export JAVA_HOME=$(/usr/libexec/java_home)
alias nv="nvim"

alias ls='eza --color=always --group-directories-first --icons'
alias ll='eza -la --icons --octal-permissions --group-directories-first'
alias l='eza -bGF --header --git --color=always --group-directories-first --icons'
alias llm='eza -lbGd --header --git --sort=modified --color=always --group-directories-first --icons' 
alias la='eza --long --all --group --group-directories-first'
alias lx='eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale --color=always --group-directories-first --icons'

alias lS='eza -1 --color=always --group-directories-first --icons'
alias lt='eza --tree --level=2 --color=always --group-directories-first --icons'
alias l.="eza -a | grep -E '^\.'"


export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm@16/bin:$PATH"

if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
  export PATH=/opt/homebrew/opt/ruby/bin:$PATH
  export PATH=`gem environment gemdir`/bin:$PATH
fi
