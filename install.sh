#!/usr/bin/env bash

set -euo pipefail

sudo apt-get purge -y docker
sudo apt-get remove -y containerd.io || true

DOCKER_CLI_PLUGINS=$HOME/.docker/cli-plugins
rm -f "$DOCKER_CLI_PLUGINS/docker-compose"
rmdir "$DOCKER_CLI_PLUGINS" || true
unset DOCKER_CLI_PLUGINS

sudo snap remove go

sudo apt-get update
sudo apt-get install -y \
    apt-file \
    apt-transport-https \
    binutils \
    build-essential \
    ccache \
    clang-15 \
    clang-format-15 \
    clang-tidy-15 \
    clangd-15 \
    cmake \
    curl \
    datamash \
    docker-compose-v2 \
    docker.io \
    dos2unix \
    fonts-hack \
    fzf \
    git \
    git-crypt \
    git-extras \
    git-lfs \
    golang-1.21 \
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

sudo apt-file update

sudo update-alternatives --install \
    /usr/bin/clang clang \
    /usr/bin/clang-15 100
sudo update-alternatives --install \
    /usr/bin/clang++ clang++ \
    /usr/bin/clang++-15 100
sudo update-alternatives --install \
    /usr/bin/clang-format clang-format \
    /usr/bin/clang-format-15 100
sudo update-alternatives --install \
    /usr/bin/clang-tidy clang-tidy \
    /usr/bin/clang-tidy-15 100
sudo update-alternatives --install \
    /usr/bin/clangd clangd \
    /usr/bin/clangd-15 100

sudo update-alternatives --install \
    /usr/local/bin/go go \
    /usr/lib/go-1.21/bin/go 100
sudo update-alternatives --install \
    /usr/local/bin/gofmt go \
    /usr/lib/go-1.21/bin/gofmt 100

sudo usermod -a -G docker "$(whoami)"

sudo snap install --classic code
sudo snap install --classic nvim
sudo snap install --classic valgrind

./install-github-cli.sh
./install-gitlab-cli.sh
./install-google-chrome.sh
./install-hadolint.sh
./install-latest-git.sh
./install-openvpn3.sh
./install-python-packages.sh
./install-vim-from-source.sh
./remove-jfrog-cli.sh

pre-commit init-templatedir ~/.git-template
