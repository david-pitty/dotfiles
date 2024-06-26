alias rm="rm -rf"
alias grep="grep  -in --color=auto"
alias mkdir="mkdir -p"
alias md="mkdir -p"
alias df="df -h"
alias dif="diff -ya"
alias aa="sudo service apache2 restart"
alias st="sudo tail -fn 0 /var/log/apache2/error.log"
alias t="tmux -2"
alias ta="tmux -2 attach"
alias ts="tmux ls"
alias vi="nvim"
alias pydev="sudo python setup.py develop"
alias pp="pecan serve config.py"
alias l="ls -alh"
alias h="head"
alias c="cat -n"
alias less="less -i"
alias copy="pbcopy"
alias pprint="python -m json.tool"
alias g="grep"
alias gr="grep -r"
alias cp="cp -a"
alias nr="npm run"
alias ns="npm start"
alias nt="npm test"
alias service-all="service --status-all"

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
