#!/bin/bash

set -euo pipefail

wget https://releases.jfrog.io/artifactory/jfrog-gpg-public/jfrog_public_gpg.key \
    -O /tmp/jfrog-cli-v2-jf.pub
sudo gpg --no-default-keyring --keyring /etc/apt/keyrings/jfrog-cli-v2-jf.gpg --import /tmp/jfrog-cli-v2-jf.pub
echo "deb [signed-by=/etc/apt/keyrings/jfrog-cli-v2-jf.gpg] https://releases.jfrog.io/artifactory/jfrog-debs xenial contrib" | \
sudo tee /etc/apt/sources.list.d/jfrog-cli-v2-jf.list
sudo apt-get update
sudo apt-get install -y jfrog-cli-v2-jf
