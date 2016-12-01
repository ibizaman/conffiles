#!/bin/sh

set -x

cd
if [ ! -d .fzf ]; then
    git clone https://github.com/junegunn/fzf.git .fzf
fi
cd .fzf
./install --all

cd
if [ ! -d .vim ]; then
    git clone https://github.com/ibizaman/conffiles.git .vim
fi
ln -s .vim/vimrc .vimrc
ln -s .vim/gitignore .gitignore
ln -s .vim/gitconfig .gitconfig
ln -s .vim/zshrc .zshrc
ln -s .vim/zsh .zsh
ln -s .vim/tmux.conf .tmux.conf
ln -s .vim/Xresources .Xresources
ln -s .vim/xinitrc .xinitrc
ln -s ~/.vim/i3 .config/i3
ln -s ~/.vim/i3status .config/i3status
cd .vim
git submodule update --init --recursive -- bundle/youcompleteme
cd bundle/youcompleteme
./install.sh
