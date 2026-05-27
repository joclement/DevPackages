#!/usr/bin/env bash

set -euo pipefail

sudo update-alternatives --remove-all go || true
sudo update-alternatives --remove-all gofmt || true

sudo snap install --classic go

sudo snap install --classic golangci-lint

go install github.com/go-critic/go-critic/cmd/gocritic@latest
go install golang.org/x/tools/cmd/goimports@latest
go install github.com/goreleaser/nfpm/v2/cmd/nfpm@latest
