Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

scoop bucket add nerd-fonts
scoop install git jq neovim nerd-fonts/Hack-NF-Mono

git config --global include.path "$(pwd)/gitconfig"
