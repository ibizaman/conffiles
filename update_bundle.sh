#!/bin/sh

function usage() {
    echo "$0 name

Updates a pathogen bundle using git subtree

name : name of the plugin"
}

test -z "$1" && usage && exit 1
plugin="$1"

remotes_file=remotes

if [ ! -f "$remotes_file" ]; then
    echo "Cannot find $remotes_file; cannot update bundle."
    exit 1
fi

repo_location=$(awk -F " " '/^'$plugin'/ {print $2}' $remotes_file)
repo_branch=$(awk -F " " '/^'$plugin'/ {print $3}' $remotes_file)
if [ -z "$repo_location" ]; then
    echo "No bundle named $plugin in remotes file."
    exit 1
fi

if ! $(git remote | grep -q $plugin); then
    git remote add "$plugin" "$repo_location" || exit 1
fi

git fetch "$plugin" || exit 1
#git branch -f "$plugin" "$plugin/$repo_branch" || exit 1

echo "Merging $plugin branch."
git merge --squash -s subtree --no-commit "$plugin/$repo_branch" || exit 1
