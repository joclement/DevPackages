#!/bin/bash

set -euo pipefail

readonly BASE_URL=https://packages.openvpn.net
readonly OPENVPN_KEY=/etc/apt/keyrings/openvpn.asc

curl --fail --silent --show-error --location \
    ${BASE_URL}/packages-repo.gpg \
    | sudo tee ${OPENVPN_KEY}

openvpn_repo="deb [arch=amd64, signed-by=${OPENVPN_KEY}] ${BASE_URL}/openvpn3/debian"
os_codename=$(lsb_release --short --codename)
openvpn_repo="$openvpn_repo $os_codename main"

echo "$openvpn_repo" > /tmp/openvpn3.list
sudo mv /tmp/openvpn3.list /etc/apt/sources.list.d/.

sudo apt-get update
sudo apt-get install --yes openvpn3
