#!/usr/bin/env bash

set -euo pipefail

sudo apt-get purge -y docker
sudo apt-get remove -y containerd.io || true

DOCKER_CLI_PLUGINS=$HOME/.docker/cli-plugins
rm -f "$DOCKER_CLI_PLUGINS/docker-compose"
rmdir "$DOCKER_CLI_PLUGINS" || true
unset DOCKER_CLI_PLUGINS

sudo apt-get update
sudo apt-get install -y \
    docker-compose-v2 \
    docker-buildx \
    docker.io

sudo usermod -a -G docker "$(whoami)"
