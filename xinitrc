#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

setxkbmap -variant altgr-intl
clipster --daemon&
xscreensaver -no-splash&
redshiftgui --min&
ckb --background&
#display
#chromium&
#firefox&
#emacs&
#viber&
#Whatsapp&

load_ssh_keys () {
    uxterm -class Float -e "sudo swapoff -a && pass open"

    for f in $(pass ls sshkey-passphrase | tail -n+2 | cut -d ' ' -f 2-); do
        SSH_ASKPASS='/home/timi/bin/ssh-askpass' \
                   ssh-add "$HOME"/.ssh/"$f" < /dev/null
    done
}
#(sleep 20 && load_ssh_keys &) &

feh --bg-fill /srv/pictures/Wallpaper/chosen_wallpaper

exec i3 >~/i3log-"$(date +'%F-%k-%M-%S')" 2>&1

# vim: set ft=sh
