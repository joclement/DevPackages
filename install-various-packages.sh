#!/usr/bin/env bash

set -euo pipefail

sudo apt-get install --yes \
    apt-file \
    apt-transport-https \
    binutils \
    build-essential \
    ccache \
    cmake \
    curl \
    datamash \
    devscripts \
    dos2unix \
    fonts-hack \
    fzf \
    git \
    git-buildpackage \
    git-crypt \
    git-extras \
    git-lfs \
    git-sizer \
    graphicsmagick-imagemagick-compat \
    htop \
    jq \
    libperl-critic-perl \
    ncal \
    net-tools \
    oathtool \
    pandoc \
    parallel \
    perl \
    pdfarranger \
    silversearcher-ag \
    shfmt \
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
