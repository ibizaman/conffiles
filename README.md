These files are my vim plugins, along with my vimrc file, my
.gitconfig and .gitignore files and my .tmux.conf file.

All bundles are included as subtree merges so every file needed is
included with a simple `git clone`, install with:

    sh ./.vim/install.sh

To add a bundle, run:

    ./add_bundle.sh nerdtree https://github.com/scrooloose/nerdtree.git

To update a bundle later on, run:

    ./update_bundle.sh nerdtree

And don't forget to reload the helptags afterwards with:

    :call pathogen#helptags()   # in vim
