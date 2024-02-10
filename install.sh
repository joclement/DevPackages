#!/usr/bin/env bash

set -euo pipefail

sudo apt-get purge -y docker
sudo apt-get remove -y containerd.io || true

sudo apt-get update
sudo apt-get install -y \
    apt-file \
    apt-transport-https \
    binutils \
    ccache \
    clang-15 \
    clang-format-15 \
    clang-tidy-15 \
    clangd-15 \
    cmake \
    curl \
    datamash \
    docker.io \
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
    perl \
    python-is-python3 \
    python3-doc \
    python3-pip \
    python3-venv \
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
    zeal

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

sudo usermod -a -G docker "$(whoami)"

sudo snap install --classic code
sudo snap install --classic nvim
sudo snap install --classic valgrind

pip install -r ./pip_requirements.txt
pipx install --pip-args=--constraint=pipx_requirements.txt black
pipx install --pip-args=--constraint=pipx_requirements.txt commitizen
pipx install --pip-args=--constraint=pipx_requirements.txt conan
pipx install --pip-args=--constraint=pipx_requirements.txt cookiecutter
pipx install --pip-args=--constraint=pipx_requirements.txt cruft
pipx install --pip-args=--constraint=pipx_requirements.txt nox
pipx inject --pip-args=--constraint=pipx_requirements.txt nox nox-poetry
pipx install --pip-args=--constraint=pipx_requirements.txt pdm
pipx install --pip-args=--constraint=pipx_requirements.txt pip-tools
pipx install --pip-args=--constraint=pipx_requirements.txt poetry
pipx install --pip-args=--constraint=pipx_requirements.txt pre-commit
pipx install --pip-args=--constraint=pipx_requirements.txt shellcheck-py
pipx install --pip-args=--constraint=pipx_requirements.txt tox

pre-commit init-templatedir ~/.git-template

./install-docker-compose.sh
./install-github-cli.sh
./install-gitlab-cli.sh
./install-google-chrome.sh
./remove-jfrog-cli.sh
./install-latest-git.sh
./install-openvpn3.sh
./install-hadolint.sh