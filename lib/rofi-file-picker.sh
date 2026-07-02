#!/usr/bin/env bash

set -euo pipefail

open_in_nvim() {
  local file_path="$1"
  alacritty -o 'window.startup_mode="Fullscreen"' -e bash -lic "nvim '$file_path'"
}

list_files_flat() {
  local root_dir="$1"

  find "$root_dir" -maxdepth 1 -mindepth 1 -type f -printf '%f\n' | sort
}

list_files_recursive_markdown() {
  local root_dir="$1"

  find "$root_dir" -type f \( -iname '*.md' -o -iname '*.markdown' \) -printf '%P\n' | sort
}

pick_and_open_file() {
  local root_dir="$1"
  local list_mode="$2"
  local choice

  case "$list_mode" in
    flat)
      choice="$(
        list_files_flat "$root_dir" | rofi_cmd || true
      )"
      ;;
    recursive_markdown)
      choice="$(
        list_files_recursive_markdown "$root_dir" | rofi_cmd || true
      )"
      ;;
    *)
      printf 'Unknown list mode: %s\n' "$list_mode" >&2
      return 1
      ;;
  esac

  [[ -z "$choice" ]] && return 0
  open_in_nvim "$root_dir/$choice"
}
