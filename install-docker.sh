#!/usr/bin/env bash

set -euo pipefail

sudo apt-get install --yes \
    docker-buildx \
    docker-compose-v2 \
    docker.io

sudo usermod --append --groups docker "$(whoami)"

docker buildx install
