#!/bin/bash

set -euo pipefail

sudo apt-get purge --yes \
    gvim \
    vim \
    vim-common \
    vim-gtk \
    vim-gtk3 \
    vim-gui-common \
    vim-nox \
    vim-runtime \
    vim-tiny

sudo apt-get autoremove --yes

sudo apt install --yes \
    libatk1.0-dev \
    libcairo2-dev \
    liblua5.4-dev \
    libncurses5-dev \
    libperl-dev \
    libpython3-dev \
    libtool-bin \
    libx11-dev \
    libxpm-dev \
    libxt-dev \
    lua5.4 \
    python3-dev \
    ruby-dev

VERSION="v9.1.0095"

if [ ! -d vim ]; then
    git clone --branch "$VERSION" --depth 1 https://github.com/vim/vim.git
fi
cd vim
git fetch
git checkout $VERSION

VERSION_OF_EXISTING_VIM="1"
if command -v vim; then
    VERSION_OF_EXISTING_VIM=$(vim --version | grep -oP '(?<=^VIM - Vi IMproved )[0-9|.]+')
fi

if ((VERSION_OF_EXISTING_VIM > VERSION)); then
    exit 1
elif ((VERSION_OF_EXISTING_VIM == VERSION)); then
    exit 0
fi

./configure \
    --enable-cscope \
    --enable-fontset \
    --enable-gnome-check \
    --enable-gpm \
    --enable-libsodium \
    --enable-luainterp \
    --enable-multibyte \
    --enable-nls \
    --enable-perlinterp \
    --enable-python3interp \
    --enable-rubyinterp \
    --enable-tclinterp \
    --disable-gui \
    --with-features=huge \
    --with-x

make

if [ -z "${CI:-}" ]; then
    make test
fi

sudo make install
