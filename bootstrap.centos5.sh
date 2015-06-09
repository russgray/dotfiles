#!/bin/sh

set -e

cd ~

# quick setup for a new centos5 vm

# install basics (TODO - dev tools)
sudo yum install -y screen curl htop git nmap-ncat ncurses-devel multitail

if [ -d dotfiles ]; then
    pushd dotfiles
    git pull
    popd
else
    git clone https://github.com/russgray/dotfiles.git
fi

# set up screen
#curl -s https://raw.githubusercontent.com/russgray/dotfiles/master/screenrc -o ~/.screenrc
cp dotfiles/screenrc ~/.screenrc

# set up bash
if [ ! -f ~/.bashrc ]; then
    cat << BASHRC > ~/.bashrc
source ~/dotfiles/bashrc
BASHRC
fi

#curl -s https://raw.githubusercontent.com/russgray/dotfiles/master/bashrc -o ~/.bashrc

# install newer vim
if [ ! -d "vim74" ]; then
    wget ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2
    tar xjf vim-7.4.tar.bz2
    rm vim-7.4.tar.bz2
    pushd vim74/
    ./configure --disable-selinux --with-features=big
    make && sudo make install
    popd
fi

if [ ! -f ~/.vimrc ]; then
    cat << VIMRC > ~/.vimrc
source ~/dotfiles/vimrc
VIMRC
fi

# set up vundle
if [ ! -d ".vim/bundle/" ]; then
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    #curl -s https://raw.githubusercontent.com/russgray/dotfiles/master/vimrc -o ~/.vimrc
    /usr/local/bin/vim +PluginInstall +qall 2&> /dev/null
fi
