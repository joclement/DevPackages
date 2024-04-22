#!/usr/bin/env bash

set -euo pipefail

pip install --user -r ./requirements.txt

xargs -L1 pipx install --force < requirements_pipx.txt
pipx inject --pip-args=--constraint=requirements_inject.txt nox nox-poetry
