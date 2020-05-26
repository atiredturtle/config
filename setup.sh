#!/bin/sh

create_symlink() {
    fileName=$1
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



