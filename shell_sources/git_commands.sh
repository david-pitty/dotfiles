alias gcl="git clone"
alias gf="git fetch"
alias gs="git status"
alias gd="git diff"
alias gdf="git diff -W"
alias gdt="git difftool"
alias gdd="git --no-pager diff --name-only"
alias gg="git stash save"
alias gg!="git stash pop"
alias ggx="git stash drop"
alias ggs="git stash list"
alias ggd="git stash show -p stash@{0}"
alias gm="git merge --no-ff"
alias gma="git merge --abort"
alias gb="git branch"
alias gba="git branch -a"
alias gbd="git branch -D"
alias ga="git add"
alias gga="git commit -av"
alias gc="git commit -v"
alias gcx="git commit --no-verify -v"
alias gc!="git commit --amend --no-edit"
alias gcx!="git commit --no-verify --amend --no-edit"
alias gp="git push"
alias gl="git pull"
alias glol="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gh="glol | head"
alias gco="git checkout"
alias gcm="git checkout master"
alias gcb="git checkout -b"
alias grb="git rebase --rebase-merges"
alias grbm="git rebase origin/master"
alias grbd="git rebase origin/develop"
alias grbc="git rebase --continue"
alias grbs="git rebase --skip"
alias grba="git rebase --abort"
alias grt="git reset"
alias grh="git reset --hard"
alias grs="git restore --staged"
alias gt="git tag"
alias gpt="git push --tags"
alias gbl="git blame"
alias gmv="git mv"

function ggp {
    git push origin $(git rev-parse --abbrev-ref HEAD)
}

function ggp! {
    git push origin +$(git rev-parse --abbrev-ref HEAD)
}

function ggpx {
    git push --no-verify origin $(git rev-parse --abbrev-ref HEAD)
}

function ggpx! {
    git push --no-verify origin +$(git rev-parse --abbrev-ref HEAD)
}

function ggl {
    git pull origin $(git rev-parse --abbrev-ref HEAD)
}

# delete a @ local + remote
function gtD {
    git tag -d $1
    git push origin :refs/tags/$1
}

function gd? {
    git diff $1~ $1
}

function gdd? {
    git --no-pager diff --name-only $1~ $1
}


# curl -o ~/.git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
source ~/.git-completion.bash
__git_complete gco _git_checkout
