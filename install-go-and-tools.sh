#!/usr/bin/env bash

set -euo pipefail

sudo apt-get install --yes \
    golang-1.21

sudo update-alternatives --install \
    /usr/local/bin/go go \
    /usr/lib/go-1.21/bin/go 100
sudo update-alternatives --install \
    /usr/local/bin/gofmt gofmt \
    /usr/lib/go-1.21/bin/gofmt 100

sudo snap install --classic golangci-lint

go install github.com/go-critic/go-critic/cmd/gocritic@latest
go install golang.org/x/tools/cmd/goimports@latest
