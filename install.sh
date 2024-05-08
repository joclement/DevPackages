#!/usr/bin/env bash

set -euo pipefail

sudo apt-get update

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
    git-crypt \
    git-extras \
    git-lfs \
    htop \
    jq \
    libperl-critic-perl \
    ncal \
    net-tools \
    oathtool \
    pandoc \
    parallel \
    perl \
    python-is-python3 \
    python3 \
    python3-doc \
    python3-pip \
    python3-venv \
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

./install-clang.sh
./install-docker.sh
./install-github-cli.sh
./install-gitlab-cli.sh
./install-golang.sh
./install-google-chrome.sh
./install-hadolint.sh
./install-latest-git.sh
./install-openvpn3.sh
./install-python-packages.sh
./install-vim-from-source.sh
./remove-jfrog-cli.sh

sudo apt-file update

pre-commit init-templatedir ~/.git-template
