#!/usr/bin/env bash

set -euo pipefail

sudo apt-get install --yes \
    clang-15 \
    clang-format-15 \
    clang-tidy-15 \
    clangd-15

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
