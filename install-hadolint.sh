#!/bin/bash

set -euo pipefail

REPO=https://github.com/hadolint/hadolint

VERSION="2.12.0"

if command -v hadolint > /dev/null; then
    VERSION_EXISTING=$(hadolint --version | grep -oE '[0-9|.]+')
fi

if [[ ${VERSION_EXISTING:-} == "$VERSION" ]]; then
    echo "$VERSION is already installed."
    exit 0
fi

mkdir -p ~/bin
curl --fail --silent --show-error --location \
    $REPO/releases/download/v${VERSION}/hadolint-Linux-x86_64 \
    --output ~/bin/hadolint
chmod +x ~/bin/hadolint
