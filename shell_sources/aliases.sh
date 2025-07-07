alias rm="rm -r"
alias grep="grep  -in --color=auto"
alias mkdir="mkdir -p"
alias md="mkdir -p"
alias df="df -h"
alias dif="diff -ya"
alias t="tmux -2"
alias ta="tmux -2 attach"
alias ts="tmux ls"
alias vi="nvim"
alias l="ls -alh"
alias h="head"
alias c="cat -n"
alias less="less -i"
alias copy="pbcopy"
alias g="grep"
alias gr="grep -r"
alias cp="cp -a"
alias nr="npm run"
alias ns="npm start"
alias nt="npm test"
alias service-all="service --status-all"
alias p="podman"
alias ggrep="git grep -n"
alias update-fonts="fc-cache -fv"
count() { l "$1" | tail -n +4 | wc -l; }
alias clip="xclip -sel clip"

alias k="kubectl"
kssh() { kubectl exec -it $1 -- bash; }
kcmd() { kubectl exec -it $1 -- $2; } # if multi-word command ($2) wrap in quotes

# python
alias py=pyenv
alias act="source venv/bin/activate"
alias deact="deactivate"
alias pprint="python -m json.tool"

# apt install libxml2-utils
alias xmllint='xmllint --format'

# mac
if [[ `uname` == 'Darwin' ]]; then
    alias ls='ls -G'
else
    alias ls='ls --color'
fi

# wsl
if [ -f "/etc/wsl.conf" ]; then
    alias open="explorer.exe"
fi

