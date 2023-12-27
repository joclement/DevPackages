#!/bin/bash

set -euo pipefail

curl -fsSL https://swupdate.openvpn.net/repos/openvpn-repo-pkg-key.pub | gpg --dearmor > /tmp/openvpn-repo-pkg-keyring.gpg
sudo mv /tmp/openvpn-repo-pkg-keyring.gpg /etc/apt/trusted.gpg.d/.
echo "deb [arch=amd64] https://swupdate.openvpn.net/community/openvpn3/repos jammy main" > /tmp/openvpn3.list
sudo mv /tmp/openvpn3.list /etc/apt/sources.list.d/openvpn3.list
sudo apt-get update
sudo apt-get install -y openvpn3
