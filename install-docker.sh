#!/usr/bin/env bash

set -euo pipefail

sudo apt-get purge --yes containerd.io || true

sudo apt-get install --yes \
    docker-buildx \
    docker-compose-v2 \
    docker.io \
    golang-docker-credential-helpers

sudo usermod --append --groups docker "$(whoami)"

docker buildx install
