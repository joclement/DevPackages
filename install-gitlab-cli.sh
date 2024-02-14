#!/bin/bash

set -euo pipefail

VERSION="1.36.0"

GITLAB_URL=https://gitlab.com/gitlab-org/cli/-/releases
GLAB_URL="$GITLAB_URL/v${VERSION}/downloads/glab_${VERSION}_Linux_x86_64.deb"

curl --fail --silent --show-error --location \
    --output-dir /tmp \
    --remote-name "$GLAB_URL"
sudo apt-get install -f /tmp/glab_${VERSION}_Linux_x86_64.deb
