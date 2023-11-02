#!/bin/bash

set -euo pipefail

curl -fsSL --output-dir /tmp -O "https://gitlab.com/gitlab-org/cli/-/releases/v1.34.0/downloads/glab_1.34.0_Linux_x86_64.deb"
sudo apt-get install -f /tmp/glab_1.34.0_Linux_x86_64.deb
