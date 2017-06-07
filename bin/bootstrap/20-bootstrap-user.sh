#!/bin/sh

set -ex

echo "Expects ~/.ssh to be pre-populated"

cd
git clone git@github.com:ibizaman/docsnippet.git
sh ./docsnippet/install-pacaur.sh

pacaur -Syu --noconfirm
pacaur -S --noconfirm \
    arch-install-script \
    attic \
    android-studio \
    android-file-transfer \
    base-devel \
    bc \
    binfmt-support \
    blender \
    browserpass \
    chromium \
    cmake \
    colorgrab \
    dunst \
    dosfstools \
    exfat \
    feh \
    fcron \
    fzf \
    git \
    gnumeric \
    google-cloud-sdk \
    hfsprogs \
    htop \
    i3 \
    iotop \
    jq \
    libinotify \
    nmap \
    nvidia \
    nvidia-settings \
    nvidia-utils \
    openssh \
    pandoc \
    paperkey \
    pass \
    pass-clip \
    pavucontrol \
    pepper-flash \
    pulseaudio \
    python \
    python2 \
    python2-gobject \
    qemu-user-static \
    qrencode \
    rofi \
    rsync \
    sickrage \
    smartmontools \
    ssmtp \
    solaar \
    spotify \
    sshfs \
    task \
    teamviewer \
    teiler-git \
    tmux \
    ttf-croscore \
    ttf-dejavu \
    ttf-inconsolata-g \
    unison \
    viber \
    vifm \
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
    getmail neomutt urlscan \ #mail

sudo usermod --shell zsh timi

cd
git clone git@github.com:ibizaman/conffiles.git .vim
sh ./.vim/install.sh

sudo systemctl start teamviewerd
sudo systemctl enable teamviewerd

sudo systemctl start fcron
sudo systemctl enable fcron

sudo systemctl enable binfmt-support
sudo systemctl start binfmt-support

sudo sh -c 'echo "ACTION=="add", SUBSYSTEM=="net", KERNEL=="eth*", RUN+="/usr/bin/ethtool -s %k wol d" > /etc/udev/rules.d/70-disable_wol.rules'
sudo sh -c 'echo "ACTION==\"add\", SUBSYSTEM==\"net\", KERNEL==\"wlan*\", RUN+=\"/usr/bin/iw dev %k set power_save on\"" > /etc/udev/rules.d/70-wifi-powersave.rules'

sudo pip2 install bugwarrior[jira] 
echo "Now log back and launch startx"
