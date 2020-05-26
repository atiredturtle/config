#!/bin/sh

create_symlink() {
    fileName=$1
    ln -sv ~/config/$fileName ~/$fileName
}

echo ***Creating Symlinks***

echo Vim
create_symlink .vim
create_symlink .vimrc

## Tmux TODO
echo Tmux
create_symlink .tmux.conf

## ZSH
# .zshrc TODO



