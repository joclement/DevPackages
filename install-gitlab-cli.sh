#!/bin/bash

set -euo pipefail

VERSION="1.47.0"

if command -v glab > /dev/null; then
    VERSION_EXISTING=$(glab version | grep -oE '[0-9|.]+')
fi

if [[ ${VERSION_EXISTING:-} == "$VERSION" ]]; then
    echo "$VERSION is already installed."
    exit 0
fi

GITLAB_URL=https://gitlab.com/gitlab-org/cli/-/releases
GLAB_URL="$GITLAB_URL/v${VERSION}/downloads/glab_${VERSION}_linux_amd64.deb"

echo "Download glab from $GLAB_URL"
curl --fail --silent --show-error --location \
    --output-dir /tmp \
    --remote-name "$GLAB_URL"
sudo apt-get install -f /tmp/glab_${VERSION}_linux_x86_64.deb
