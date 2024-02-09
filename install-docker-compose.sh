#!/bin/bash

set -euo pipefail

REPO_URL=https://github.com/docker/compose

VERSION="v2.23.3"

sudo apt-get purge --yes docker-compose-v2

mkdir --parents ~/.docker/cli-plugins/
curl --fail --silent --show-error --location \
    ${REPO_URL}/releases/download/${VERSION}/docker-compose-linux-x86_64 \
    --output ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose
