#!/bin/bash

set -euo pipefail

GLAB_VERSION="1.34.0"

curl -fsSL --output-dir /tmp -O "https://gitlab.com/gitlab-org/cli/-/releases/v${GLAB_VERSION}/downloads/glab_${GLAB_VERSION}_Linux_x86_64.deb"
sudo apt-get install -f /tmp/glab_${GLAB_VERSION}_Linux_x86_64.deb
