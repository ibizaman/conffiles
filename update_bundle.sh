#!/bin/sh


function usage() {
    echo "$0 bundle

Updates a pathogen bundle using git subtree

bundle : name of plugin"
}

test -z "$1" && usage && exit 1
branch="$1"

git checkout "$branch" \
&& git pull \
&& git checkout "@{-1}" \
&& git merge --squash -s subtree --no-commit "$branch" \
|| exit 1
