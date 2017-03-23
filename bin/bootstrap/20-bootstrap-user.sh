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
    blender \
    browserpass \
    chromium \
    cmake \
    colorgrab \
    dunst \
    exfat \
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
    nvidia-utils \
    openssh \
    paperkey \
    pass \
    pavucontrol \
    pepper-flash \
    pulseaudio \
    python \
    python2 \
    qrencode \
    rofi \
    rsync \
    sickrage \
    solaar \
    spotify \
    teamviewer \
    teiler-git \
    tmux \
    ttf-croscore \
    ttf-dejavu \
    ttf-inconsolata-g \
    unison \
    viber \
    vim \
    vlc \
    whatsapp-desktop \
    wit \
    xclip \
    xf86-input-libinput \
    xorg-apps\
    xorg-server \
    xorg-server-utils \
    xorg-utils \
    xorg-xinit \
    xscreensaver \
    xterm \
    zathura \
    zathura-pdf-poppler \
    zbar \
    zsh \

sudo usermod --shell zsh timi

cd
git clone git@github.com:ibizaman/conffiles.git .vim
sh ./.vim/install.sh

sudo systemctl start teamviewerd
sudo systemctl enable teamviewerd

sudo sh -c 'echo "ACTION=="add", SUBSYSTEM=="net", KERNEL=="eth*", RUN+="/usr/bin/ethtool -s %k wol d" > /etc/udev/rules.d/70-disable_wol.rules'
sudo sh -c 'echo "ACTION==\"add\", SUBSYSTEM==\"net\", KERNEL==\"wlan*\", RUN+=\"/usr/bin/iw dev %k set power_save on\"" > /etc/udev/rules.d/70-wifi-powersave.rules'

echo "Now log back and launch startx"
