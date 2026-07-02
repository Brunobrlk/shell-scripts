#!/usr/bin/env bash
# Description: 

set -euo pipefail

[[ -n "${SHELL_SCRIPTS_XDG_LOADED:-}" ]] && return
readonly SHELL_SCRIPTS_XDG_LOADED=1

readonly APP_NAME="shell-scripts"

readonly XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
readonly XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
readonly XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
readonly XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

readonly APP_CONFIG_DIR="$XDG_CONFIG_HOME/$APP_NAME"
readonly APP_DATA_DIR="$XDG_DATA_HOME/$APP_NAME"
readonly APP_CACHE_DIR="$XDG_CACHE_HOME/$APP_NAME"
readonly APP_STATE_DIR="$XDG_STATE_HOME/$APP_NAME"

xdg_init() {
  mkdir -p \
    "$APP_CONFIG_DIR" \
    "$APP_DATA_DIR" \
    "$APP_CACHE_DIR" \
    "$APP_STATE_DIR"
}

load_config() {
  local config="$APP_CONFIG_DIR/config"

  if [[ -f "$config" ]]; then
    source "$config"
  fi
}
