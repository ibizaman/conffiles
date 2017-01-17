#!/bin/sh

set -ex

echo "Expects ~/.ssh to be pre-populated"

cd
git clone git@github.com:ibizaman/docsnippet.git
sh ./docsnippet/install-pacaur.sh

pacaur -Syu --noconfirm
pacaur -S --noconfirm \
    attic \
    android-studio \
    android-file-transfer \
    base-devel \
    chromium \
    cmake \
    colorgrab \
    dunst \
    feh \
    git \
    gnumeric \
    google-cloud-sdk \
    hfsprogs \
    i3 \
    libinotify \
    nmap \
    nvidia \
    nvidia-settings \
    nvidia-utils openssh \
    pavucontrol \
    pepper-flash \
    pulseaudio \
    python \
    python2 \
    rofi \
    rsync \
    teamviewer \
    teiler-git \
    tmux \
    ttf-dejavu \
    ttf-inconsolata-g \
    unison \
    viber \
    vim \
    wit \
    xclip \
    xf86-input-libinput \
    xorg-apps\
    xorg-server \
    xorg-server-utils \
    xorg-xinit \
    xterm \
    zathura \
    zathura-pdf-poppler \
    zsh \

sudo usermod --shell zsh timi

cd
git clone git@github.com:ibizaman/conffiles.git .vim
sh ./.vim/install.sh

sudo systemctl start teamviewerd
sudo systemctl enable teamviewerd

echo "Now log back and launch startx"
