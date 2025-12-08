#!/bin/bash

# Author: Bruno Guimarães
# Description: Brief description of what the script does
# Version: 1.0
# Last Updated: YYYY-MM-DD

set -euo pipefail

TARGET="$HOME/.local/bin"
mkdir -p "$TARGET"

for script in bin/*; do
  name=$(basename "$script")
  ln -sf "$(pwd)/$script" "$TARGET/$name"
  chmod +x "$TARGET/$name"
  echo "Installed: $name → $TARGET/$name"
done
