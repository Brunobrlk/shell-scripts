#!/bin/bash

# Author: Bruno Guimarães
# Description: Brief description of what the script does
# Version: 1.0
# Last Updated: YYYY-MM-DD

SCRIPT_PATH=$(dirname "$(realpath "$0")")

ln -s "$SCRIPT_PATH/buildc" "$HOME/.local/bin/buildc"
ln -s "$SCRIPT_PATH/cheatsheet" "$HOME/.local/bin/cheatsheet"
ln -s "$SCRIPT_PATH/kvm_export_import" "$HOME/.local/bin/kvm_export_import"
ln -s "$SCRIPT_PATH/newscript" "$HOME/.local/bin/newscript"
ln -s "$SCRIPT_PATH/productinfo" "$HOME/.local/bin/productinfo"

# Scripts that are only executable with sudo
sudo ln -s "$SCRIPT_PATH/vmsfolder" /usr/local/bin/vmsfolder
