#!/usr/bin/env bash

set -euo pipefail

sudo apt-get purge --yes \
    clang-14 \
    clang-15 \
    clang-format-15 \
    clang-tidy-15 \
    clangd-15

sudo apt-get install --yes \
    clang-20 \
    clang-format-20 \
    clang-tidy-20 \
    clangd-20

sudo update-alternatives --install \
    /usr/bin/clang clang \
    /usr/bin/clang-20 100
sudo update-alternatives --install \
    /usr/bin/clang++ clang++ \
    /usr/bin/clang++-20 100
sudo update-alternatives --install \
    /usr/bin/clang-format clang-format \
    /usr/bin/clang-format-20 100
sudo update-alternatives --install \
    /usr/bin/clang-tidy clang-tidy \
    /usr/bin/clang-tidy-20 100
sudo update-alternatives --install \
    /usr/bin/clangd clangd \
    /usr/bin/clangd-20 100
