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
    curl \
    datamash \
    debhelper \
    devscripts \
    dos2unix \
    fonts-hack \
    git \
    git-crypt \
    git-extras \
    git-lfs \
    git-sizer \
    htop \
    hyperfine \
    jq \
    libperl-critic-perl \
    lsd \
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
    zeal \
    zsh

sudo snap install --classic code
sudo snap install --classic nvim
sudo snap install --classic valgrind

git lfs install
