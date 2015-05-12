#!/bin/sh

set -e

# quick setup for a new centos5 vm

# install basics (TODO - dev tools)
sudo yum install -y screen curl htop git nmap-ncat ncurses-devel

# set up screen
curl -s https://raw.githubusercontent.com/russgray/dotfiles/master/screenrc -o ~/.screenrc

# set up bash
curl -s https://raw.githubusercontent.com/russgray/dotfiles/master/bashrc -o ~/.bashrc

# install newer vim
wget ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2
tar xjf vim-7.4.tar.bz2
rm vim-7.4.tar.bz2
pushd vim74/
./configure --disable-selinux --with-features=big
make && sudo make install
popd

# set up vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
curl -s https://raw.githubusercontent.com/russgray/dotfiles/master/vimrc -o ~/.vimrc
/usr/local/bin/vim +PluginInstall +qall 2&> /dev/null
