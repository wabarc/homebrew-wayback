#!/bin/bash
#
set -eu pipefail

source ~/.profile

brew tap wabarc/wayback
brew install wayback

ls -l ~/.local/bin/wayback || exit 1
