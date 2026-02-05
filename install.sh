#!/usr/bin/env bash
# Author: Bruno Guimarães
# Description:
# Version: 1.0
# Last Updated: 2025-12-10

set -euo pipefail
IFS=$'\n\t'

logi() { printf '\033[0;34m[BRLK INFO]\033[0m - %s\n' "$1"; }
logs() { printf '\033[0;32m[BRLK SUCCESS]\033[0m - %s\n' "$1"; }
loge() { printf '\033[0;31m[BRLK ERROR]\033[0m - %s\n' "$1" >&2; }

# ──────────────────────────────────────────────────────────────────────────────
# Constants / Config
# ──────────────────────────────────────────────────────────────────────────────
readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ──────────────────────────────────────────────────────────────────────────────
# Functions
# ──────────────────────────────────────────────────────────────────────────────
install_to_dir() {
  local target_dir="$1"
  mkdir -p "$target_dir"

  echo "Installing scripts into $target_dir"
  for script in "$SCRIPT_DIR/bin"/*; do
    local name="$(basename "$script")"
    if ln -sf "$script" "$target_dir/$name" && chmod +x "$target_dir/$name"; then
      logi "Script installed: $name"
    else
      loge "Failed to install: $name" >&2
    fi
  done
  logs "Finish installation"
}

# ──────────────────────────────────────────────────────────────────────────────
# Main
# ──────────────────────────────────────────────────────────────────────────────
main() {
  install_to_dir "$HOME/.local/bin"
}

# ──────────────────────────────────────────────────────────────────────────────
# Entry Point
# ──────────────────────────────────────────────────────────────────────────────
# Only run main if script is executed (not sourced)
[[ "${BASH_SOURCE[0]}" == "${0}" ]] && main "$@"
