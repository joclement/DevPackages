#!/bin/bash

set -euo pipefail

sudo apt-get purge --yes cmake cmake-qt-gui kitware-archive-keyring || true
sudo rm -f /usr/share/keyrings/kitware-archive-keyring.gpg \
    /etc/apt/sources.list.d/kitware.list

sudo apt-get update
sudo apt-get install --yes cmake
