#!/bin/sh

# quick setup for a new centos7 vm

# install basics
sudo yum install -y screen curl htop git nmap-ncat vim-enhanced

# set up screen
curl -s https://raw.githubusercontent.com/russgray/dotfiles/master/screenrc -o ~/.screenrc

# set up bash
curl -s https://raw.githubusercontent.com/russgray/dotfiles/master/bashrc -o ~/.bashrc

# set up vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
curl -s https://raw.githubusercontent.com/russgray/dotfiles/master/vimrc -o ~/.vimrc
vim +PluginInstall +qall