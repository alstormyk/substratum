#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1
curl -Lo /etc/yum.repos.d/che-nerd-fonts-fedora-"${RELEASE}".repo https://copr.fedorainfracloud.org/coprs/che/nerd-fonts/repo/fedora-"${RELEASE}"/che-nerd-fonts-fedora-"${RELEASE}".repo
curl -Lo /etc/yum.repos.d/peterwu-rendezvous-fedora-"${RELEASE}".repo https://copr.fedorainfracloud.org/coprs/peterwu/rendezvous/repo/fedora-"${RELEASE}"/peterwu-rendezvous-fedora-"${RELEASE}".repo
# this installs a package from fedora repos
rpm-ostree install alacritty dunst fzf helix jetbrains-mono-fonts kanshi mako nerd-fonts \
                   rofi-wayland sddm \
                   sway swaybg sway-config swaylock sway-systemd thunar \
                   waybar wayfire wf-shell wlr-randr wlsunset wofi

# this would install a package from rpmfusion
# rpm-ostree install vlc

#### Example for enabling a System Unit File

systemctl enable podman.socket
