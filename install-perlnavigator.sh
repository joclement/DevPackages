#!/bin/bash

set -euo pipefail

REPO=https://github.com/bscan/PerlNavigator
VERSION="0.8.20"
ASSET="perlnavigator-linux-x86_64.zip"
DEST="${HOME}/.local/bin/perlnavigator"

# APT 0.6.0 lacks workspace/workspaceFolders support needed by ALE.
sudo apt-get purge --yes perlnavigator

tmpdir=$(mktemp -d)

curl --fail --silent --show-error --location \
    "${REPO}/releases/download/v${VERSION}/${ASSET}" \
    --output "${tmpdir}/${ASSET}"

unzip -qo "${tmpdir}/${ASSET}" -d "${tmpdir}/extract"
binary=$(find "${tmpdir}/extract" -type f -name perlnavigator -print -quit)

mkdir -p "${HOME}/.local/bin"
echo "Install perlnavigator ${VERSION} to ${DEST}."
install -m 755 "${binary}" "${DEST}"
