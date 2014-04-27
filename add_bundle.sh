#!/bin/sh

function usage() {
    echo "$0 repo url [repo_branch]

Add a remote git repository as a pathogen plugin thanks to git subtree

repo : local name of repo
url : repository location
repo_branch : branch of the remote"
}

test -z "$1" || test -z "$2" && usage && exit 1
branch="$1"
install_dir=bundle/"$1"

repo_name="$1"
repo_location="$2"
repo_branch=${3:-"master"}

git remote add "$repo_name" "$repo_location" \
&& git fetch "$repo_name" \
&& git branch "$branch" "$repo_name"/"$repo_branch" \
&& mkdir -p "$install_dir" \
&& git read-tree --prefix="$install_dir" -u "$branch" \
|| exit 1
