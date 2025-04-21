# Install Powershell Core from Windows Store
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

# scoop
scoop bucket add nerd-fonts
scoop bucket add extras
# git installation through scoop may not work with credential manager
scoop install jq neovim erd busybox extras/universal-ctags nerd-fonts/Hack-NF-Mono

# git
git config --global include.path "$(pwd)/gitconfig"

# nvim - posh sets configuration file to be in repo now
# Copy-Item -Recurse -Force nvim\ ~\AppData\Local\

# alacritty
md -Force ~\AppData\Roaming\alacritty
echo 'import=["~/projects/dotfiles/alacritty.toml"]' > ~\AppData\Roaming\alacritty\alacritty.toml
