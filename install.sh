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
#ln -s .vim/vimrc .vimrc
Ln -s ~/.vim/gitignore .gitignore
ln -s ~/.vim/gitconfig .gitconfig
ln -s ~/.vim/zshrc .zshrc
ln -s ~/.vim/zsh .zsh
ln -s ~/.vim/tmux.conf .tmux.conf
ln -s ~/.vim/Xresources .Xresources
ln -s ~/.vim/xinitrc .xinitrc
mkdir -p .config
ln -s ~/.vim/i3 .config
ln -s ~/.vim/i3status .config
ln -s ~/.vim/dunst .config
ln -s ~/.vim/bin .
#ln -s ~/.vim/vifmrc .config/vifm/vifmrc
ln -s ~/.vim/muttrc .muttrc
ln -s ~/.vim/mailcap .mailcap
ln -s ~/.vim/psqlrc .psqlrc
ln -s ~/.vim/emacs .emacs
ln -s ~/.vim/emacs-custom.el .emacs-custom.el
#cd .vim
#git submodule update --init --recursive -- bundle/youcompleteme
#cd bundle/youcompleteme
#./install.sh
