#!/usr/bin/env bash

set -euo pipefail

# TODO avoid `PIP_BREAK_SYSTEM_PACKAGES=1`, see #157
PIP_BREAK_SYSTEM_PACKAGES=1 pip install --user --requirement ./requirements.txt

xargs -L1 pipx install --force < requirements_pipx.txt
pipx inject --pip-args=--constraint=requirements_inject.txt nox nox-poetry
