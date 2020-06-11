#!/bin/sh
set -x

# Core CLI
echo Installing Core CLI Apps
# Homebrew (https://brew.sh/)
if [[ $(command -v brew) == "" ]]; then
    echo "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
    echo "Updating Homebrew"
    # brew epdate
fi

brew install tmux
brew install yarn
brew cask install java

# Zsh
echo Installing zsh packages
# OhMyZsh (https://github.com/ohmyzsh/ohmyzsh)
OHMYZSH=~/.oh-my-zsh
if [[ ! -d $OHMYZSH ]]; then
    git clone https://github.com/robbyrussell/oh-my-zsh.git $OHMYZSH
    source $OHMYZSH/oh-my-zsh.sh
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Zinit(https://github.com/zdharma/zinit) 
if [[ $(command -v zinit) == "" ]]; then
    echo installing Zinit
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
fi

# Powerlevel10k theme (https://github.com/romkatv/powerlevel10k)
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k


# Vim
echo Installing and setting up Vim
# Vim-Plug (https://github.com/junegunn/vim-plug)
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# run vim plugins
vim +PlugInstall +qall

# Visual Apps
echo Installing Visual Apps
brew cask install rectangle
brew cask install google-chrome
brew cask install visual-studio-code
brew cask install iterm2

echo Installing "nice to have" Apps
brew cask install spotify
brew cask install evernote
brew cask install notion
