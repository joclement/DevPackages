#!/usr/bin/env bash

set -euo pipefail

sudo apt-get install --yes \
    python-is-python3 \
    python3 \
    python3-doc \
    python3-pip \
    python3-venv

# TODO avoid `PIP_BREAK_SYSTEM_PACKAGES=1`, see #157
PIP_BREAK_SYSTEM_PACKAGES=1 pip install --user --requirement ./requirements.txt

xargs -L1 pipx install --force < requirements_pipx.txt
pipx inject \
    --force --pip-args=--constraint="$(pwd)/requirements_inject.txt" nox nox-poetry
