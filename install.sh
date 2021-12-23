unalias echo

# BASH
# echo "if [ -f ~/.bashrc ]; then . ~/.bashrc; fi" > ~/.bash_profile
echo "source $(pwd)/shell_sources/bashrc" >> ~/.bashrc
echo "source $(pwd)/shell_sources/aliases.sh" >> ~/.bashrc
echo "source $(pwd)/shell_sources/git_commands.sh" >> ~/.bashrc
echo "source $(pwd)/shell_sources/bash_prompt.sh" >> ~/.bashrc

# ZSH
# echo "source $(pwd)/shell_sources/zshrc" >> ~/.zshrc
# echo "source $(pwd)/shell_sources/git_commands.sh" >> ~/.zshrc
# echo "source $(pwd)/shell_sources/aliases.sh" >> ~/.zshrc

# linux inputrc
echo "\$include $(pwd)/inputrc" >> ~/.inputrc

# vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo ":so $(pwd)/vim/vimrc" >> ~/.vimrc

# TMUX
echo "source-file $(pwd)/tmux.conf" >> ~/.tmux.conf

# git bash for windows
# cat ./minttyrc > ~/.minttyrc

# GIT
git config --global include.path "$(pwd)/gitcofig"
git config --global core.excludesfile "$(pwd)/gitignore_global"

# VSCODE
# ln -s vscode/keybindings.json ~/AppData/Roaming/Code/User/keybindings.json
# ln -s vscode/settings.json ~/AppData/Roaming/Code/User/settings.json

# NEOVIM
mkdir -p ~/.config
ln -s $(pwd)/nvim ~/.config/nvim
