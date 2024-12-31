#!/usr/bin/env bash

set -euo pipefail

sudo apt-get install --yes \
    libenchant-2-2 \
    pipx \
    python-is-python3 \
    python3 \
    python3-doc \
    python3-pip \
    python3-venv

xargs -L1 pipx install --force < requirements_pipx.txt
pipx inject \
    --force --pip-args=--constraint="$(pwd)/requirements_inject.txt" nox nox-poetry

sudo add-apt-repository --yes ppa:deadsnakes/ppa
sudo apt-get update
