# Run this at root

set -ex

wifi-menu

pacman -Syu --noconfirm
pacman -S --noconfirm sudo augeas

useradd --create-home --groups wheel timi
passwd timi

chown -R :wheel /usr/local
chmod -R g=u /usr/local

augtool << HERE
touch '/files/etc/sudoers/spec[last()+1]'
set '/files/etc/sudoers/spec[last()]/user' '%wheel'
set '/files/etc/sudoers/spec[last()]/host_group/host' 'ALL'
set '/files/etc/sudoers/spec[last()]/host_group/command' 'ALL'
set '/files/etc/sudoers/spec[last()]/host_group/command/runas_user' 'ALL'
save
HERE

cat << HERE >> /etc/pacman.conf
[multilib-testing]
Include = /etc/pacman.d/mirrorlist

[multilib]
Include = /etc/pacman.d/mirrorlist
HERE


# Avoid problems with SD Card reader https://askubuntu.com/a/704028/697223
sudo sh -c 'echo options sdhci debug_quirks=0x40 >> /etc/modprobe.d/sdhci-pci.conf'
sudo modprobe -r sdhci-pci sdhci
sudo modprobe sdhci-pci
