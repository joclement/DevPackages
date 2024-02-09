#!/bin/bash

set -euo pipefail

REPO=https://github.com/hadolint/hadolint

VERSION="v2.12.0"

mkdir -p ~/bin
curl --fail --silent --show-error --location \
    $REPO/releases/download/${VERSION}/hadolint-Linux-x86_64 \
    --output ~/bin/hadolint
chmod +x ~/bin/hadolint
