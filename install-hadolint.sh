#!/bin/bash

set -euo pipefail

VERSION="v2.12.0"

mkdir -p ~/bin
curl -fsSL https://github.com/hadolint/hadolint/releases/download/${VERSION}/hadolint-Linux-x86_64 \
     --output ~/bin/hadolint
chmod +x ~/bin/hadolint
