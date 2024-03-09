#!/bin/bash

set -euo pipefail

VERSION="9.1.0095"

if command -v vim > /dev/null; then
    VERSION_EXISTING=$(vim --version | grep -oP '(?<=^Included patches: )\d+\-\d+')
fi

MINOR_VERSION=$(echo $VERSION | cut -d'.' -f2)
PATCH_VERSION=$(echo $VERSION | cut -d'.' -f3 | sed 's/^0*//')
MINOR_AND_PATCH_VERSION="$MINOR_VERSION-$PATCH_VERSION"

if [[ ${VERSION_EXISTING:-} == "$MINOR_AND_PATCH_VERSION" ]]; then
    echo "$VERSION is already installed."
    exit 0
fi

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

sudo apt-get install --yes \
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

if [ ! -d vim ]; then
    git clone --filter=tree:0 https://github.com/vim/vim.git
fi
cd vim
git checkout "v$VERSION"

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

cd ..
