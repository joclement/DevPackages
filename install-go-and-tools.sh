#!/usr/bin/env bash

set -euo pipefail

GO_VERSION="1.23"
readonly GO_VERSION

sudo apt-get install --yes \
    golang-$GO_VERSION

sudo update-alternatives --remove-all go || true
sudo update-alternatives --remove-all gofmt || true

sudo update-alternatives --install \
    /usr/local/bin/go go \
    /usr/lib/go-$GO_VERSION/bin/go 100
sudo update-alternatives --install \
    /usr/local/bin/gofmt gofmt \
    /usr/lib/go-$GO_VERSION/bin/gofmt 100

sudo snap install --classic golangci-lint

go install github.com/go-critic/go-critic/cmd/gocritic@latest
go install golang.org/x/tools/cmd/goimports@latest
