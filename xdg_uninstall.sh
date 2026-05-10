#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

logi() { printf '\033[0;34m[INFO]\033[0m %s\n' "$1"; }
logs() { printf '\033[0;32m[SUCCESS]\033[0m %s\n' "$1"; }

# ──────────────────────────────────────────────────────────────────────────────
# Constants / Config
# ──────────────────────────────────────────────────────────────────────────────
readonly APP_NAME="shell-scripts"
readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly BIN_DIR="$HOME/.local/bin"
readonly PROJECT_BIN_DIR="$(readlink -f "$SCRIPT_DIR/bin")"

# ──────────────────────────────────────────────────────────────────────────────
# Functions
# ──────────────────────────────────────────────────────────────────────────────
remove_symlinks() {
  for file in "$BIN_DIR"/*; do
    [[ -L "$file" ]] || continue

    local target
    target="$(readlink -f "$file")"

    if [[ "$target" == "$PROJECT_BIN_DIR/"* ]]; then
      rm "$file"
      logi "Removed: $(basename "$file")"
    fi
  done
}

# ──────────────────────────────────────────────────────────────────────────────
# Main
# ──────────────────────────────────────────────────────────────────────────────
main() {
  remove_symlinks
  logs "Uninstall completed"
}

# ──────────────────────────────────────────────────────────────────────────────
# Entry Point
# ──────────────────────────────────────────────────────────────────────────────
# Only run main if script is executed (not sourced)
[[ "${BASH_SOURCE[0]}" == "${0}" ]] && main "$@"
