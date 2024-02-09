#!/bin/bash

set -euo pipefail

CHROME_URL=http://dl.google.com/linux/chrome/deb/

GPG_KEY_PATH=/etc/apt/keyrings/google-chrome.gpg

wget https://dl-ssl.google.com/linux/linux_signing_key.pub -O /tmp/google.pub
sudo gpg --no-default-keyring --keyring $GPG_KEY_PATH --import /tmp/google.pub
echo "deb [arch=amd64 signed-by=$GPG_KEY_PATH] $CHROME_URL stable main" \
    | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt-get update
sudo apt-get install -y google-chrome-stable
