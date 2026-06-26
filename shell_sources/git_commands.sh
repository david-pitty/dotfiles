alias gcl="git clone"
alias gf="git fetch"
alias gs="git status"
alias gd="git diff"
alias gda="git diff -W"
alias gdf="git diff -W"
alias gdt="git difftool"
alias gdd="git --no-pager diff --name-only"
alias gg="git stash save"
alias gg!="git stash pop"
alias ggx="git stash drop"
alias ggs="git stash list"
alias ggd="git stash show -p stash@{0}"
alias gm="git merge"
alias gmff="git merge --no-ff"
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
function gsearch { git log -p -S $1 -- $2; } # searches for pattern and includes the commit diff
alias gh="glol | head"
alias gco="git checkout"
alias gcb="git checkout -b"
alias grb="git rebase --rebase-merges"
alias grbc="git rebase --continue"
alias grbs="git rebase --skip"
alias grba="git rebase --abort"
alias grbo="git rebase --onto" # branch commit(exclusive)
alias grt="git reset"
alias grh="git reset --hard"
alias grs="git restore --staged"
alias gt="git tag"
alias gpt="git push --tags"
alias gbl="git blame"
alias gmv="git mv"
alias gwhich="git remote get-url origin"

function gmm {
    git merge origin/$(git rev-parse --abbrev-ref HEAD)
}

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


# self-describing/more readable aliases
alias gclone="gcl"
alias gfetch="gf"
alias gstatus="gs"
alias gdiff="gd"
alias gdiff-all="gda"
alias gdiff-all="gdf"
alias gdiff-fullfile="gda"
alias gdiff-fullfile="gdf"
alias gdiff-tool="gdt"
alias gdiff-files="gdd"
alias gdiff-commit="gd?"
alias gdiff-commit-files="gdd?"
alias gstash="gg"
alias gstash-save="gg"
alias gstash-pop="gg!"
alias gstash-drop="ggx"
alias gstash-list="ggs"
alias gstash-view="ggd"
alias gstash-diff="ggd"
alias gmerge="gm"
alias gmerge-noff="gmff"
alias gmerge-nofastforward="gmff"
alias gmerge-abort="gma"
alias gmerge-ff="gmm"
alias gmerge-fastforward="gmm"
alias gbranch-local="gb"
alias gbranch-all="gba"
alias gbranch-delete="gbd"
alias gadd="ga"
alias gadd-edits="gga"
alias gcommit="gc"
alias gcommit-noverify="gcx"
alias gcommit-amend="gc!"
alias gcommit-amend-noverify="gcx!"
alias gpush="gp"
alias gpush-noverify="ggpx"
alias gpush-force="ggp!"
alias gpush-force-noverify="ggpx!"
alias gpull="gl"
alias gpull-branch="gll"
alias glog-pretty="glol"
alias glog-search="gsearch"
alias glog-pretty-head="gh"
alias gcheckout="gco"
alias gcheckout-branch="gcb"
alias grebase="grb"
alias grebase-continue="grbc"
alias grebase-skip="grbs"
alias grebase-abort="grba"
alias grebase-onto="grbo"
alias greset="grt"
alias greset-hard="grh"
alias grestore="grs"
alias gtag="gt"
alias gpush-tags="gpt"
alias gblame="gbl"
alias gmove="gmv"
alias grepo-url="gwhich"


# curl -o ~/.git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
source ~/.git-completion.bash
__git_complete gco _git_checkout
__git_complete gb  _git_checkout
__git_complete gcb _git_checkout
__git_complete gbd _git_checkout
__git_complete gd _git_checkout
__git_complete grb _git_rebase
__git_complete grbo _git_rebase
__git_complete gm _git_merge
__git_complete gmff _git_merge
