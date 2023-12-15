#!/bin/bash

set -euo pipefail

VERSION="v2.23.3"

mkdir -p ~/.docker/cli-plugins/
curl -fsSL https://github.com/docker/compose/releases/download/${VERSION}/docker-compose-linux-x86_64 \
     --output ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose
