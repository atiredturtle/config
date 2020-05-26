#!/bin/sh

create_symlink() {
    fileName=$1
    ln -sv ~/config/$fileName ~/$fileName
}

echo ***Creating Symlinks***
## Vim
echo Vim
create_symlink .vim
create_symlink .vimrc

## Tmux TODO

## ZSH
# .zshrc TODO



