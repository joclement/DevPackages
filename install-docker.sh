#!/usr/bin/env bash

set -euo pipefail

sudo apt-get remove -y containerd.io || true

sudo apt-get update
sudo apt-get install -y \
    docker-compose-v2 \
    docker-buildx \
    docker.io

sudo usermod -a -G docker "$(whoami)"
