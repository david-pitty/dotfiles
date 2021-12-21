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
function head { Get-Content -Head 10 $args }
function tail { Get-Content -Tail 10 $args }

# Git Commands
function gcl { git clone $args }
function gf { git fetch }
function gs { git status }
function gg { git stash save }
function gg! { git stash pop }
function ggx { git stash drop }
function ggs { git stash list }
function ggd { git stash show -p stash@{0} }
function gm { git merge --no-ff $args }
function gma { git merge --abort }
function gb { git branch }
function gba { git branch -a }
function gbd { git branch -D $args }
function ga { git add args1}
function gga { git commit -av }
function gc { git commit -v }
function gp { git push }
function gl { git pull }
function glol { git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit }
function gco { git checkout $args }
function gcm { git checkout master }
function gcb { git checkout -b $args }
function grb { git rebase $args }
function grbm { git rebase origin/master }
function grbd { git rebase origin/develop }
function grbc { git rebase --continue }
function grbs { git rebase --skip }
function grba { git rebase --abort }
function grt { git reset $args }
function grh { git reset --hard $args }
function grs { git restore --staged $args }
function gt { git tag }
function gpt { git push --tags }
function gbl { git blame $args }
function gmv { git mv $args }
function ggp { git push origin $(git rev-parse --abbrev-ref HEAD) }
function ggp! { git push origin +$(git rev-parse --abbrev-ref HEAD) }
function ggpx { git push --no-verify origin $(git rev-parse --abbrev-ref HEAD) }
function ggpx! { git push --no-verify origin +$(git rev-parse --abbrev-ref HEAD) }
function ggl { git pull origin $(git rev-parse --abbrev-ref HEAD) }
function gdt { git difftool }
function gd { git diff $args }
function gd? { git diff $1~ $args }
function gdd { git --no-pager diff --name-only $args }
function gdd? { git --no-pager diff --name-only $1~ $args }
