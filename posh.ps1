Import-Module Microsoft.PowerShell.Management # running first to overwrite gcb alias

function prompt {
    try {
        $branch_prompt = ''
        $branch = git rev-parse --abbrev-ref HEAD
        if ($?) {
            $branch_prompt = " ($branch)"
        }
        # else {
        # }
    } catch {}
    Write-Host "PS" -NoNewline -ForegroundColor 'green'
    Write-Host " $($ExecutionContext.SessionState.Path.CurrentLocation)" -NoNewline -ForegroundColor 'yellow'
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
Set-Alias vi nvim
Set-Alias h head
Set-Alias g grep
Set-Alias vi nvim
Set-Alias open ii
Remove-Alias rm -Force; function rm { Remove-Item -Recurse $args }
Remove-Alias cp -Force; function cp { Copy-Item -Recurse @args }
function ns { npm start }
function nt { npm test }
function nr { npm run $args}
function gr($pattern) { Get-ChildItem -Recurse | Select-String $pattern -List }
Remove-Alias gv -Force; function gv { findstr /V $args }
Set-Alias docker podman
function tree { erd --suppress-size }

# Git Commands
Remove-Alias gc -Force
Remove-Alias gcb -Force
Remove-Alias gl -Force
Remove-Alias gm -Force
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
function ga { git add $args }
function gga { git commit -av }
function gc { git commit -v }
function gcx { git commit --no-verify -v }
function gp { git push }
function gl { git pull }
function glol { git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit }
function gco { git checkout $args }
function gcm { git checkout master }
function gcb { git checkout -b $args }
function grb { git rebase --rebase-merges $args }
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
function gd?($1){ git diff $1~ $1 }
function gdd { git --no-pager diff --name-only $args }
function gdd?($1) { git --no-pager diff --name-only $1~ $1 }

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
