Import-Module Microsoft.PowerShell.Management # running first to overwrite gcb alias

function prompt {
    try {
        $repo_name = $(git rev-parse --show-toplevel | grep -oE "[^/]+$")
        $branch_prompt = ''
        $branch = git rev-parse --abbrev-ref HEAD
        if ($?) {
            $branch_prompt = " ($repo_name`: $branch)"
        }
        # else {
        # }
    } catch {}
    Write-Host "PS" -NoNewline -ForegroundColor 'green'
    Write-Host " $((Get-Item $PWD).Name)" -NoNewline -ForegroundColor 'yellow'
    # Write-Host " $($ExecutionContext.SessionState.Path.CurrentLocation)" -NoNewline -ForegroundColor 'yellow' # full path
    Write-Host "$($branch_prompt)" -NoNewline -ForegroundColor 'cyan'
    Write-Output "$('>' * ($nestedPromptLevel + 1)) "
}

# Readline https://docs.microsoft.com/en-us/powershell/module/psreadline/about/about_psreadline?view=powershell-7.2
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadlineKeyHandler -Key ctrl+d -Function ViExit
Set-PSReadlineKeyHandler -Key ctrl+u -Function BackwardKillLine

# Alias
Set-Alias which Get-Command
function l { Get-ChildItem -Force $args }
function ll { Get-ChildItem -Force $args }
Remove-Alias ls -Force; function ls { Get-ChildItem -Force $args | Sort-Object -Descending {$_.LastWriteTime} }

Set-Alias g grep
function ggrep { git grep -nE $args }
Remove-Alias gi -Force; function gi { grep -in $args }
function gr { grep -rn $args }
function gri { grep -irn $args }

function ns { npm start $args }
function nt { npm test $args }
function nr { npm run $args}

Set-Alias vi nvim
Set-Alias h head
Set-Alias open Invoke-Item
Set-Alias p podman

Set-Alias k kubectl
function kssh($pod) { kubectl exec -it $pod -- bash }

Remove-Alias rm -Force
Remove-Alias cp -Force; function cp { Copy-Item -Recurse @args }
Remove-Alias gv -Force; function gv { findstr /V $args }
Remove-Alias diff -Force
function take($dirName) { mkdir $dirName && cd $dirName }

function ..() { cd ..\.. }
function ...() { cd ..\..\.. }
function ....() { cd ..\..\..\.. }
function .....() { cd ..\..\..\..\.. }


# Git Commands
Remove-Alias gc -Force
Remove-Alias gcb -Force
Remove-Alias gl -Force
Remove-Alias gm -Force
function gcl { git clone $args }
function gf { git fetch }
function gs { git status }
function gsa { git status --ignored }
function gg { git stash save }
function gg! { git stash pop }
function ggx { git stash drop }
function ggs { git stash list }
function ggd { git stash show -p stash@{0} }
function gm { git merge --no-ff $args }
function gma { git merge --abort }
function gb { git branch $args }
function gba { git branch -a }
function gbd { git branch -D $args }
function ga { git add $args }
function gga { git commit -av $args }
function ggax { git commit --no-verify -av $args }
function gga! { git add .; git commit --amend --no-edit $args }
function gc { git commit -v $args }
function gcx { git commit --no-verify -v $args }
function gc! { git commit --amend --no-edit $args }
function gcx! { git commit --no-verify --amend --no-edit $args }
function gp { git push }
function gl { git pull }
function glol { git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit }
function gh { glol | head }
function gco { git checkout $args }
function gcb { git checkout -b $args }
function grb { git rebase --rebase-merges $args }
function grbc { git rebase --continue }
function grbs { git rebase --skip }
function grba { git rebase --abort }
function grbo ($commit, $branch) { git rebase --onto $branch $commit }
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
function gdf { git diff -W $args } # full context
function gd?($1){ git diff $1~ $1 $args }
function gdd { git --no-pager diff --name-only $args }
function gdd?($1) { git --no-pager diff --name-only $1~ $1 $args }

# Python
function act { venv/Scripts/Activate.ps1 }
function deact { deactivate }

function colors {
    $colors = [enum]::GetValues([System.ConsoleColor])
    Foreach ($bgcolor in $colors){
        Foreach ($fgcolor in $colors) { Write-Host "$fgcolor|"  -ForegroundColor $fgcolor -BackgroundColor $bgcolor -NoNewLine }
        Write-Host " on $bgcolor"
    }
}

# Environment variables
# variable for neovim to search for init.vim
$env:XDG_CONFIG_HOME = $(Resolve-Path "~/projects/dotfiles").Path
