#!/bin/bash

# Author: Bruno Guimarães
# Description: Brief description of what the script does
# Version: 1.0
# Last Updated: YYYY-MM-DD


set -euo pipefail

TARGET="$HOME/.local/bin"

for script in bin/*; do
    name=$(basename "$script")
    if [ -L "$TARGET/$name" ]; then
        rm "$TARGET/$name"
        echo "Removed: $name"
    fi
done
