#!/usr/bin/env bash

set -euo pipefail

pip install -r ./pip_requirements.txt

xargs -L1 pipx install < pipx_requirements.txt
pipx inject --pip-args=--constraint=inject_requirements.txt nox nox-poetry
