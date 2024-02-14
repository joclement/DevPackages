#!/bin/bash

set -euo pipefail

REPO_URL=https://github.com/docker/compose

VERSION="v2.23.3"

if docker compose > /dev/null; then
    VERSION_EXISTING=$(docker compose version | grep -oE 'v[0-9|.]+')
fi

if [[ $VERSION_EXISTING == "$VERSION" ]]; then
    echo "$VERSION is already installed."
    exit 0
fi

sudo apt-get purge --yes docker-compose-v2

mkdir --parents ~/.docker/cli-plugins/
curl --fail --silent --show-error --location \
    ${REPO_URL}/releases/download/${VERSION}/docker-compose-linux-x86_64 \
    --output ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose
