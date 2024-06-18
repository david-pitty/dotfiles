# Install Powershell Core from Windows Store
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

# scoop
scoop bucket add nerd-fonts extras
scoop install git jq neovim erd busybox extras/universal-ctags nerd-fonts/Hack-NF-Mono

# git
git config --global include.path "$(pwd)/gitconfig"

# nvim
Copy-Item -Recurse -Force nvim\ ~\AppData\Local\
