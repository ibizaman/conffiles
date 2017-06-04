#!/bin/bash

# Assumes you have:
#   pacman -S pass fcron

account="$1"
accounts=$(pass ls getmail | tail -n+2 | cut -d' ' -f2)

if [[ -z "$account" || "$accounts" != *"$account"* ]]; then
    echo -e "USAGE $0 ACCOUNT\n\nWith ACCOUNT one of:"
    echo "$accounts"
    echo -e "\nCreate a pass file inside getmail/account@server.com"
    echo "whose content is an app password created with"
    echo "https://myaccount.google.com/apppasswords"
    exit 1
fi

logfile="$HOME/.getmail/log-$account"
conffile="$HOME/.getmail/${account}rc"
maildir="$HOME/Mail/$account/"
password="$(pass show getmail/$account)"

mkdir -p "$maildir"{cur,new,tmp}

cat <<HERE > "$conffile"
[retriever]
type = SimpleIMAPSSLRetriever
server = imap.gmail.com
mailboxes = ALL
# Comes from https://myaccount.google.com/apppasswords
username = $account
password = $password

[destination]
type = Maildir
path = $maildir

[options]
read_all = False
delivered_to = false
received = false
verbose = 2
message_log = $logfile
HERE

echo "Created $conffile"

echo -e "Add to crontab the following line:\n@5  getmail --rcfile=$conffile"
