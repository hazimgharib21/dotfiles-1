#!/bin/bash

echo "Installing git, byobu, vim"
echo "---------------------------"
echo ""

sudo apt-get purge vim vim-tiny
sudo apt-get install -y git byobu vim

echo "Installing Vundle"
echo "---------------------------"
echo ""

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Sync setup file"
echo "---------------------------"
echo ""

CUR_DIR=$(pwd)
echo $CUR_DIR

rsync -rvh --stats --progress --exclude "*.sh" --exclude "*.md" --include ".*" . ~/

echo "Installing vim plugin"
echo "---------------------------"
echo ""

vim -c 'PluginInstall' -c 'qa!'


echo "DONE"
echo "---------------------------"
echo ""

