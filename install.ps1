# Install Powershell Core from Windows Store
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

# scoop
scoop bucket add nerd-fonts
scoop install git jq neovim erd busybox nerd-fonts/Hack-NF-Mono

# git
git config --global include.path "$(pwd)/gitconfig"

# nvim
Copy-Item -Recurse -Force nvim\ ~\AppData\Local\
