# Readline https://docs.microsoft.com/en-us/powershell/module/psreadline/about/about_psreadline?view=powershell-7.2
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadlineKeyHandler -Key ctrl+d -Function ViExit

# Alias
Remove-Alias gc -Force
Set-Alias which get-command
Set-Alias l ls
Set-Alias ll ls
Set-Alias vi nvim
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
Set-Alias g findstr
Set-Alias vi nvim

# Git Commands
function gcl($1) { git clone $1}
function gf { git fetch }
function gs { git status }
function gg { git stash save }
function gg! { git stash pop }
function ggx { git stash drop }
function ggs { git stash list }
function ggd { git stash show -p stash@{0} }
function gm($1) { git merge --no-ff $1 }
function gma { git merge --abort }
function gb { git branch }
function gba { git branch -a }
function gbd($1) { git branch -D $1 }
function ga($1) { git add $1}
function gga { git commit -av }
function gc { git commit -v }
function gp { git push }
function gl { git pull }
function glol { git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit }
function gco($1) { git checkout $1 }
function gcm { git checkout master }
function gcb($1) { git checkout -b $1 }
function grb($1) { git rebase $1 }
function grbm { git rebase origin/master }
function grbd { git rebase origin/develop }
function grbc { git rebase --continue }
function grbs { git rebase --skip }
function grba { git rebase --abort }
function grt($1) { git reset $1 }
function grh($1) { git reset --hard $1 }
function grs($1) { git restore --staged $1 }
function gt { git tag }
function gpt { git push --tags }
function gbl($1) { git blame $1 }
function gmv($1) { git mv $1 }
function ggp { git push origin $(git rev-parse --abbrev-ref HEAD) }
function ggp! { git push origin +$(git rev-parse --abbrev-ref HEAD) }
function ggpx { git push --no-verify origin $(git rev-parse --abbrev-ref HEAD) }
function ggpx! { git push --no-verify origin +$(git rev-parse --abbrev-ref HEAD) }
function ggl { git pull origin $(git rev-parse --abbrev-ref HEAD) }
function gdt { git difftool }
function gd($1) { git diff $1 }
function gd?($1) { git diff $1~ $1 }
function gdd($1) { git --no-pager diff --name-only $1 }
function gdd?($1) { git --no-pager diff --name-only $1~ $1 }
