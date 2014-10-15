These files are my vim plugins, along with my vimrc file and my
.gitconfig and .gitignore files.

All bundles are included as subtree merges so every file needed is
included with a simple `git clone`, so install with:

    cd
    git clone git://github.com/ibizaman/vimfiles.git .vim
    ln -s .vim/vimrc .vimrc
    ln -s .vim/.gitignore .
    ln -s .vim/.gitconfig .
    # install youcompleteme's submodules
    cd .vim
    git submodule update --init --recursive
    cd bundle/youcompleteme
    [EXTRA_CMAKE_ARGS='...'] ./install.sh [--clang-completer [--system-libclang]] [--omnisharp-completer]

To add a bundle, run:

    ./add_bundle.sh nerdtree https://github.com/scrooloose/nerdtree.git

To update a bundle later on, run:

    ./update_bundle.sh nerdtree

And don't forget to reload the helptags afterwards with:

    :Helptags   # in vim
