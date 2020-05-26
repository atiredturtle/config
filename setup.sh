#!/bin/sh

create_symlink() {
    fileName=$1
    # TODO: add route for forcing if file already exists
    ln -sv ~/config/$fileName ~/$fileName
}

echo ***Creating Symlinks***

echo Vim
create_symlink .vim
create_symlink .vimrc

echo Tmux
create_symlink .tmux.conf

echo Zsh
create_symlink .zshrc

create_symlink .p10k.zsh

create_symlink .vim.zsh # adds vim mode properly to zsh

echo ***Git setup***
echo What is your Github username?
read username
echo What is your Github email?
read email
echo Modifying git config
git config --global user.name $username
git config --global user.email $email 

