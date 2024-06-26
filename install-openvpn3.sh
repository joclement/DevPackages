#!/bin/bash

set -euo pipefail

curl --fail --silent --show-error --location \
    https://swupdate.openvpn.net/repos/openvpn-repo-pkg-key.pub \
    | gpg --dearmor > /tmp/openvpn-repo-pkg-keyring.gpg
sudo mv /tmp/openvpn-repo-pkg-keyring.gpg /etc/apt/trusted.gpg.d/.

os_version=$(lsb_release -sr)
openvpn_repo="deb [arch=amd64] https://swupdate.openvpn.net/community/openvpn3/repos"
if [[ $os_version == "22.04" ]]; then
    openvpn_repo="$openvpn_repo jammy main"
elif [[ $os_version == "24.04" ]]; then
    openvpn_repo="$openvpn_repo noble main"
    # TODO https://github.com/joclement/DevPackages/issues/153
    echo "Installing openvpn3 on Ubuntu24.04 does not work yet," \
        "see https://github.com/OpenVPN/openvpn3-linux/issues/253"
    exit 0
else
    echo "OS version $os_version is unsupported"
    exit 1
fi

echo "$openvpn_repo" > /tmp/openvpn3.list
sudo mv /tmp/openvpn3.list /etc/apt/sources.list.d/.

sudo apt-get update
sudo apt-get install --yes openvpn3
