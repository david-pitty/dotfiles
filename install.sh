echo "source $(pwd)/shell_sources/bashrc" >> ~/.bashrc
echo "source $(pwd)/shell_sources/aliases" >> ~/.bashrc
echo "source $(pwd)/shell_sources/git_commands" >> ~/.bashrc

echo "source $(pwd)/shell_sources/zshrc" >> ~/.zshrc
echo "source $(pwd)/shell_sources/git_commands" >> ~/.zshrc
echo "source $(pwd)/shell_sources/aliases" >> ~/.zshrc

echo ":so $(pwd)/vim/plugins.vim" >> ~/.vimrc
echo ":so $(pwd)/vim/vimrc" >> ~/.vimrc
echo ":so $(pwd)/vim/keybinding.vim" >> ~/.vimrc

echo "source-file $(pwd)/tmux.conf" >> ~/.tmux.conf

cat ./minttyrc > ~/.minttyrc

git config --global include.path "$(pwd)/gitcofig"
