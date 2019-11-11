#!/bin/bash

set -exuo pipefail

# Source common functions
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
# shellcheck source=utils/common.sh
. "$DIR/utils/common.sh"

# Get deps required for VisualCAmkES
as_root apt-get update -q
as_root apt-get install -y --no-install-recommends \
        graphviz \
        python-pyqt5 \
        python-pyqt5.qtsvg \
        xauth \
        xvfb

for p in "pip2" "pip3";
do
    as_root ${p} install --no-cache-dir \
        ansi2html \
        graphviz \
        pydotplus
done
