#!/bin/bash

function usage() {
    echo "$0 name url [repo_branch [install_dir]]

Add a remote git repository as a pathogen plugin thanks to git subtree

name : local name of the plugin
url : repository location
repo_branch : branch of the remote (default: 'master')
install_dir : installation directory (default: 'bundle')"
}

test -z "$1" || test -z "$2" && usage && exit 1
plugin="$1"
install_dir=${4:-"bundle"}/"$plugin"

repo_location="$2"
repo_branch=${3:-"master"}
remotes_file=remotes

existing_plugin=$(awk -F " " '/^'$plugin'/ {print $2}' $remotes_file)
if [ ! -z "$existing_plugin" ]; then
    echo "Plugin already exists in remotes file, aborting."
    exit 1
fi

git remote add "$plugin" "$repo_location" \
&& git fetch "$plugin" \
&& mkdir -p "$install_dir" \
&& git read-tree --prefix="$install_dir" -u "$plugin"/"$repo_branch" \
&& echo "$plugin $repo_location $repo_branch" >> "$remotes_file" \
|| exit 1
