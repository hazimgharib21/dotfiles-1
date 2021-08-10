#!tbin/bash

CUR_DIR=$(pwd)

echo "Installing git, byobu, vim"
echo "---------------------------"
echo ""

sudo apt-get purge -y vim vim-tiny
sudo apt-get update -y
sudo apt-get install -y git byobu vim-nox

echo "Loading Dotfiles"
echo "---------------------------"
echo ""

cp .vimrc ~/.vimrc
cp .byobu/keybindings.tmux ~/.byobu/keybindings.tmux
cp .byobu/.tmux.conf ~/.byobu/.tmux.conf
cp .vim/ftplugin/ ~/.vim/

echo "Installing Vundle"
echo "---------------------------"
echo ""

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Installing vim plugin"
echo "---------------------------"
echo ""

vim -c 'PluginInstall' -c 'qa!'

echo "DONE"
echo "---------------------------"
echo ""

