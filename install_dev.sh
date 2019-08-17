#!/bin/bash

echo "Installing dev tools..."
echo "---------------------------"
echo ""

sudo apt-get purge vim vim-tiny
sudo apt-get install -y git byobu vim-nox htop build-essential dkms python-pip python-virtualenv python-dev npm

echo "Upgrading setuptools..."
echo "---------------------------"
echo ""

pip install -U pip setuptools

echo "Configuraing npm..."
echo "---------------------------"
echo ""

ln -s /usr/bin/nodejs /usr/bin/node
npm config set strict-ssl false
npm install -g npm@3.89
hash -r npm


echo "Installing Vundle"
echo "---------------------------"
echo ""

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Sync setup file"
echo "---------------------------"
echo ""

CUR_DIR=$(pwd)
cd $CUR_DIR
rsync -rvh --stats --progress --exclude "*.sh" --exclude "*.md" --exclude ".git/" --include ".*" . ~/

echo "Installing vim plugin..."
echo "---------------------------"
echo ""

vim -c 'PluginInstall' -c 'qa!'

echo "Configuring bashrc..."
echo "---------------------------"
echo ""

sed -i -r 's/#?force_color_prompt=.*$/force_color_prompt=yes/' ~/.bashrc
echo 'stty -ixon' >> ~/.bashrc

echo "Completing other configuration..."
echo "---------------------------"
echo ""

sudo chown -R $USER /usr/local/lib
sudo chown -R $USER /usr/local/

pip install --user autopep8
npm install -g js-beautify@1.6.12
cd /tmp
wget http://downloads.sourceforge.net/project/astyle/astyle/astyle%203.1/astyle_3.1_linux.tar.gz
tar -zxf astyle_3.1_linux.tar.gz
cd /tmp/astyle/build/gcc
make
sudo make install
cd ~
sudo update-alternatives --set editor /usr/bin/vim.nox

echo "$USER ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/$USER
sudo chmod 0400 /etc/sudoers.d/$USER

echo "DONE"
echo "---------------------------"
echo ""

