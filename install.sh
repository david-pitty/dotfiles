echo "if [ -f ~/.bashrc ]; then . ~/.bashrc; fi" > ~/.bash_profile

echo "source $(pwd)/shell_sources/bashrc" >> ~/.bashrc
echo "source $(pwd)/shell_sources/aliases" >> ~/.bashrc
echo "source $(pwd)/shell_sources/git_commands" >> ~/.bashrc
#echo "source $(pwd)/shell_sources/bash_prompt" >> ~/.bashrc

#echo "source $(pwd)/shell_sources/zshrc" >> ~/.zshrc
#echo "source $(pwd)/shell_sources/git_commands" >> ~/.zshrc
#echo "source $(pwd)/shell_sources/aliases" >> ~/.zshrc

echo "\$include $(pwd)/inputrc" >> ~/.inputrc

#curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo ":so $(pwd)/vim/plugins.vim" >> ~/.vimrc
echo ":so $(pwd)/vim/vimrc" >> ~/.vimrc
echo ":so $(pwd)/vim/keybinding.vim" >> ~/.vimrc
#echo ":so $(pwd)/vim/powershell.vim" >> ~/.vimrc
#echo ":so $(pwd)/vim/javascript.vim" >> ~/.vimrc
#echo ":so $(pwd)/vim/python.vim" >> ~/.vimrc

echo "source-file $(pwd)/tmux.conf" >> ~/.tmux.conf

cat ./minttyrc > ~/.minttyrc

git config --global include.path "$(pwd)/gitcofig"
git config --global core.excludesfile "$(pwd)/gitignore_global"
