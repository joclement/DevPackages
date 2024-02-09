#!/bin/bash

set -euo pipefail

GLAB_VERSION="1.36.0"

GITLAB_URL=https://gitlab.com/gitlab-org/cli/-/releases
GLAB_URL="$GITLAB_URL/v${GLAB_VERSION}/downloads/glab_${GLAB_VERSION}_Linux_x86_64.deb"

curl --fail --silent --show-error --location \
    --output-dir /tmp \
    --remote-name "$GLAB_URL"
sudo apt-get install -f /tmp/glab_${GLAB_VERSION}_Linux_x86_64.deb
