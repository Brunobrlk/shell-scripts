#!/usr/bin/env bash
# Author: Bruno Guimarães
# Description: Delete internal scripts installed on specific folders
# Version: 1.0
# Last Updated: 2025-12-09

set -euo pipefail
IFS=$'\n\t'

logi() { printf '\033[0;34m[BRLK INFO]\033[0m - %s\n' "$1"; }
logs() { printf '\033[0;32m[BRLK SUCCESS]\033[0m - %s\n' "$1"; }

# ──────────────────────────────────────────────────────────────────────────────
# Functions
# ──────────────────────────────────────────────────────────────────────────────
delete_scripts_in_dir(){
  local target_dir="$1"

  if [[ ! -d "$target_dir" ]]; then
    echo "Directory not found: $target_dir" >&2
    return 1  
  fi

  for file in "$target_dir"/*; do
    local resolved_file="$(readlink "$file")"

    if [[ "$resolved_file" == *"/shell-scripts/bin/"* ]]; then
      rm "$file" || echo "Failed to delete: $file" >&2
      logi "Script deleted: $(basename "$file")"
    fi
  done
  logs "Finish deleting"
}

# ──────────────────────────────────────────────────────────────────────────────
# Main
# ──────────────────────────────────────────────────────────────────────────────
main() {
  delete_scripts_in_dir "$HOME/.local/bin"
}

# ──────────────────────────────────────────────────────────────────────────────
# Entry Point
# ──────────────────────────────────────────────────────────────────────────────
# Only run main if script is executed (not sourced)
[[ "${BASH_SOURCE[0]}" == "${0}" ]] && main "$@"
