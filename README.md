These files are my vim plugins, along with my vimrc file, my
.gitconfig and .gitignore files and my .tmux.conf file.

All bundles are included as subtree merges so every file needed is
included with a simple `git clone`, so install with:

    cd
    git clone https://github.com/junegunn/fzf.git .fzf
    cd .fzf
    ./install --all
    cd -
    git clone https://github.com/ibizaman/vimfiles.git .vim
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
    ln -s ~/.vim/dunst .config/dunst
    ln -s ~/.vim/bin bin
    ln -s .vim/muttrc .muttrc
    ln -s .vim/mailcap .mailcap
    # install youcompleteme's submodules
    cd .vim
    git submodule update --init --recursive -- bundle/youcompleteme
    cd bundle/youcompleteme
    [EXTRA_CMAKE_ARGS='...'] ./install.sh [--clang-completer [--system-libclang]] [--omnisharp-completer]

or
    
    sh ./.vim/install.sh

To add a bundle, run:

    ./add_bundle.sh nerdtree https://github.com/scrooloose/nerdtree.git

To update a bundle later on, run:

    ./update_bundle.sh nerdtree

And don't forget to reload the helptags afterwards with:

    :call pathogen#helptags()   # in vim
