#!/bin/bash

set -euo pipefail

REPO_URL=https://cli.github.com/packages

ARCH=$(dpkg --print-architecture)

GPG_KEY=githubcli-archive-keyring.gpg
GPG_KEY_PATH=/usr/share/keyrings/$GPG_KEY

curl --fail --silent --show-error --location \
    $REPO_URL/$GPG_KEY \
    | sudo dd of=$GPG_KEY_PATH
sudo chmod go+r $GPG_KEY_PATH
echo "deb [arch=$ARCH signed-by=$GPG_KEY_PATH] $REPO_URL stable main" \
    | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt-get update
sudo apt-get install gh -y
