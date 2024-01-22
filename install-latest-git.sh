#!/bin/bash

set -euo pipefail

sudo add-apt-repository --yes ppa:git-core/ppa
sudo apt-get update
sudo apt-get install --yes git
