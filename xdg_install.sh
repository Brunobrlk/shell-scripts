#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

logi() { printf '\033[0;34m[INFO]\033[0m %s\n' "$1"; }
logs() { printf '\033[0;32m[SUCCESS]\033[0m %s\n' "$1"; }
loge() { printf '\033[0;31m[ERROR]\033[0m %s\n' "$1" >&2; }

# ──────────────────────────────────────────────────────────────────────────────
# Constants / Config
# ──────────────────────────────────────────────────────────────────────────────
readonly APP_NAME="shell-scripts"
readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly BIN_DIR="$HOME/.local/bin"

readonly CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/$APP_NAME"
readonly DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/$APP_NAME"
readonly CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/$APP_NAME"
readonly STATE_DIR="${XDG_STATE_HOME:-$HOME/.local/state}/$APP_NAME"

# ──────────────────────────────────────────────────────────────────────────────
# Functions
# ──────────────────────────────────────────────────────────────────────────────
create_xdg_dirs() {
    mkdir -p \
        "$CONFIG_DIR" \
        "$DATA_DIR" \
        "$CACHE_DIR" \
        "$STATE_DIR"
}

install_scripts() {
    mkdir -p "$BIN_DIR"
    for script in "$SCRIPT_DIR/bin"/*; do
        local name
        name="$(basename "$script")"

        ln -sf "$script" "$BIN_DIR/$name"
        chmod +x "$script"

        logi "Installed: $name"
    done
}

install_default_config() {
    local config_file="$CONFIG_DIR/config.sh"

    if [[ ! -f "$config_file" ]]; then
        cat >"$config_file" <<'EOF'
# add config here

EOF

        logi "Created default config"
    fi
}

# ──────────────────────────────────────────────────────────────────────────────
# Main
# ──────────────────────────────────────────────────────────────────────────────
main() {
    install_scripts

    logs "Installation completed"
}

# ──────────────────────────────────────────────────────────────────────────────
# Entry Point
# ──────────────────────────────────────────────────────────────────────────────
# Only run main if script is executed (not sourced)
[[ "${BASH_SOURCE[0]}" == "${0}" ]] && main "$@"
