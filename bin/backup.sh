#!/bin/sh

contains() {
    [[ $1 =~ (^|[[:space:]])$2($|[[:space:]]) ]]
}

if ! ls ~/.password-store >/dev/null 2>&1; then
    echo "Could not access ~/.password-store/, please open the pass tomb."
    exit 1
fi

if ! [ -f ~/.config/borg/include_files ]; then
    echo "Could not find ~/.config/borg/include_files, please create the file with one directory or file to include per line. $HOME will be substitued."
    exit 1
fi

if ! [ -f ~/.config/borg/exclude_files ]; then
    echo "Could not find ~/.config/borg/exclude_files, please create the file with one directory or file to include per line. $HOME will be substitued."
    exit 1
fi

host="$1"
available_hosts="$(ls ~/.password-store/server-passwords)"
if [ -z "$host" ] || ! contains "$available_hosts" "$host"; then
    echo "$0 HOST"
    echo "HOST must be one of:"
    echo "$available_hosts"
    exit 1
fi
shift

HOST=$(hostname)
export BORG_REPO=$host:/srv/backup/users/$HOST/$USER.borg
export BORG_PASSCOMMAND="pass show attic-passphrase/$HOST/$USER"
export PYTHONWARNINGS=ignore

include_files="$(cat $HOME/.config/borg/include_files \
                 | sed s,\$HOME,$HOME, \
                 | paste --serial --delimiter=' ' -)"


exclude_files="$(cat $HOME/.config/borg/exclude_files \
                 | sed s,\$HOME,$HOME, \
                 | sed s,^,--exclude=, \
                 | paste --serial --delimiter=' ' -)"


# Just run this once
#borg init \
#     --encryption=keyfile-blake2 \
#     $BORG_REPO

echo using repo "$BORG_REPO"

echo borg create

borg create \
    --stats \
    --list \
    ::'{hostname}-{now}' \
    $include_files \
    --exclude-caches \
    $exclude_files \
    || exit 1

echo borg prune

borg prune \
    --list \
    --prefix ::'{hostname}-' \
    --keep-daily=7 \
    --keep-weekly=4 \
    --keep-monthly=6 \
    || exit 1


echo borg check

borg check \
    --prefix ::'{hostname}-' \
    || exit 1
