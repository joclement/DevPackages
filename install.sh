#!/usr/bin/env bash

set -euo pipefail

sudo apt-get update

./install-various-packages.sh
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
