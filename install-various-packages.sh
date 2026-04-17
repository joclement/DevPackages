#!/usr/bin/env bash

set -euo pipefail

sudo apt-get update

sudo apt-get install --yes \
    apt-file \
    apt-transport-https \
    bat \
    binutils \
    build-essential \
    ccache \
    cmake \
    curl \
    datamash \
    debhelper \
    devscripts \
    dos2unix \
    fonts-hack \
    git \
    git-absorb \
    git-crypt \
    git-delta \
    git-extras \
    git-lfs \
    git-sizer \
    htop \
    hyperfine \
    jq \
    libperl-critic-perl \
    lsd \
    myrepos \
    ncal \
    net-tools \
    oathtool \
    pandoc \
    parallel \
    pdfarranger \
    perl \
    shfmt \
    silversearcher-ag \
    swaks \
    tig \
    tmux \
    traceroute \
    tree \
    universal-ctags \
    xclip \
    xmlstarlet \
    yamllint \
    yq \
    zeal \
    zsh

sudo rm -f /usr/local/bin/bat
sudo ln --force --symbolic /usr/bin/batcat /usr/local/bin/cat

sudo snap set system refresh.retain=2

sudo snap refresh

sudo snap remove code
sudo snap install --classic nvim
sudo snap install --classic valgrind

echo "Install lfs for git"
git -C /tmp lfs install
