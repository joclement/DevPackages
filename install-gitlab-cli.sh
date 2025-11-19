#!/bin/bash

set -euo pipefail

VERSION="1.77.0"

if command -v glab > /dev/null; then
    VERSION_EXISTING=$(glab version | grep -oE '[0-9|.]+')
fi

if [[ ${VERSION_EXISTING:-} == "$VERSION" ]]; then
    echo "$VERSION is already installed."
    exit 0
fi

GITLAB_URL=https://gitlab.com/gitlab-org/cli/-/releases
GLAB_PKG_FILENAME="glab_${VERSION}_linux_amd64.deb"
GLAB_URL="$GITLAB_URL/v$VERSION/downloads/${GLAB_PKG_FILENAME}"

echo "Download glab from $GLAB_URL"
curl --fail --silent --show-error --location \
    --output-dir /tmp \
    --remote-name "$GLAB_URL"
sudo apt-get install /tmp/${GLAB_PKG_FILENAME}
