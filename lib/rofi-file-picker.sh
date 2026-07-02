#!/usr/bin/env bash

set -euo pipefail

open_in_nvim() {
  local file_path="$1"
  alacritty -o 'window.startup_mode="Fullscreen"' -e bash -lic "nvim '$file_path'"
}

copy_to_clipboard() {
  if command -v wl-copy >/dev/null 2>&1 && [[ -n "${WAYLAND_DISPLAY:-}" || "${XDG_SESSION_TYPE:-}" == "wayland" ]]; then
    wl-copy
    return 0
  fi

  if command -v xclip >/dev/null 2>&1 && [[ -n "${DISPLAY:-}" ]]; then
    xclip -selection clipboard
    return 0
  fi

  if command -v xsel >/dev/null 2>&1 && [[ -n "${DISPLAY:-}" ]]; then
    xsel --clipboard --input
    return 0
  fi

  if command -v wl-copy >/dev/null 2>&1; then
    wl-copy
    return 0
  fi

  if command -v xclip >/dev/null 2>&1; then
    xclip -selection clipboard
    return 0
  fi

  if command -v xsel >/dev/null 2>&1; then
    xsel --clipboard --input
    return 0
  fi

  printf 'No clipboard tool found. Install wl-copy, xclip, or xsel.\n' >&2
  return 1
}

list_files_flat() {
  local root_dir="$1"

  find "$root_dir" -maxdepth 1 -mindepth 1 -type f -printf '%f\n' | sort
}

list_markdown_files_flat() {
  local root_dir="$1"

  find "$root_dir" -maxdepth 1 -mindepth 1 -type f \( -iname '*.md' -o -iname '*.markdown' \) -printf '%f\n' | sort
}

list_files_recursive_markdown() {
  local root_dir="$1"

  find "$root_dir" -type f \( -iname '*.md' -o -iname '*.markdown' \) -printf '%P\n' | sort
}

list_files_recursive_markdown_excluding() {
  local root_dir="$1"
  local excluded_dir_name="$2"

  find "$root_dir" \
    -path "$root_dir/$excluded_dir_name" -prune -o \
    -type f \( -iname '*.md' -o -iname '*.markdown' \) -printf '%P\n' | sort
}

normalize_markdown_filename() {
  local input="$1"
  local trimmed
  local sanitized

  trimmed="$(printf '%s' "$input" | sed -E 's/^[[:space:]]+//; s/[[:space:]]+$//')"
  sanitized="${trimmed//\//-}"
  sanitized="${sanitized//\\/-}"

  [[ -z "$sanitized" ]] && return 1

  case "$sanitized" in
    *.md|*.markdown)
      printf '%s\n' "$sanitized"
      ;;
    *)
      printf '%s.md\n' "$sanitized"
      ;;
  esac
}

resolve_markdown_file() {
  local root_dir="$1"
  local choice="$2"
  local direct_path="$root_dir/$choice"
  local markdown_path="$root_dir/$choice.md"
  local normalized_name

  if [[ -f "$direct_path" ]]; then
    printf '%s\n' "$direct_path"
    return 0
  fi

  if [[ -f "$markdown_path" ]]; then
    printf '%s\n' "$markdown_path"
    return 0
  fi

  normalized_name="$(normalize_markdown_filename "$choice")" || return 1
  printf '%s\n' "$root_dir/$normalized_name"
}

pick_copy_or_create_markdown_file() {
  local root_dir="$1"
  local choice
  local file_path

  mkdir -p "$root_dir"

  choice="$(
    list_markdown_files_flat "$root_dir" | rofi_cmd || true
  )"
  [[ -z "$choice" ]] && return 0

  file_path="$(resolve_markdown_file "$root_dir" "$choice")"

  if [[ -f "$file_path" ]]; then
    copy_to_clipboard < "$file_path"
    return 0
  fi

  open_in_nvim "$file_path"
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
