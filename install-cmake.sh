#!/bin/bash

set -euo pipefail

kitware_gpg_key=/usr/share/keyrings/kitware-archive-keyring.gpg

kitware_key_url=https://apt.kitware.com/keys/kitware-archive-latest.asc
test -f /usr/share/doc/kitware-archive-keyring/copyright \
    || wget --output-document=- $kitware_key_url 2> /dev/null \
    | gpg --dearmor - \
        | sudo tee $kitware_gpg_key > /dev/null

echo "deb [signed-by=$kitware_gpg_key] https://apt.kitware.com/ubuntu/ jammy main" \
    | sudo tee /etc/apt/sources.list.d/kitware.list > /dev/null

sudo apt-get update
sudo apt-get install --yes cmake cmake-qt-gui kitware-archive-keyring
