# Import-Module posh-git
if ($(pwd).Path -eq "C:\Windows\System32" -or $(pwd).Path -eq "C:\Windows") {
    cd ~
}
. $env:USERPROFILE\projects\dotfiles\posh.ps1