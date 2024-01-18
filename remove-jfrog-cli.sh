#!/bin/bash

set -euo pipefail

sudo rm -f /etc/apt/keyrings/jfrog-cli-v2-jf.gpg
sudo rm -f /etc/apt/sources.list.d/jfrog-cli-v2-jf.list
sudo apt-get purge --yes jfrog-cli-v2-jf || true
