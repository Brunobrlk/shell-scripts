# Personal Automation Scripts

A collection of shell scripts for daily automation, Android development, and system maintenance.

## Installation

```bash
./install.sh
```

This will symlink all scripts in `bin/` to `~/.local/bin/`.

## Scripts

- `add_android_dep`: Add Android dependencies to gradle files
- `buildc`: Clean, build and install APK in one command
- `cheatsheet`: Quick reference for Android dev tools
- `deep_clean_mint`: System cleanup for Linux Mint
- `kvm_export_import`: Export/import KVM VMs for backup
- `newscript`: Generate new shell script templates
- `random_wallpaper`: Set random wallpaper from folder
- `vmsfolder`: Navigate to VM storage directory

## Uninstall

```bash
./uninstall.sh
```

Removes all symlinks created during installation.
# TODO
[] Refactor scripts(Improve code)
    [x] buildc
    [x] droid-appclass
    [] droid-gen-mappers
    [] droid-mkapp
    [] gen-debug-symbols
    [] kvm-export-import
    [] mint-clean
    [] newscript
    [] random-wallpaper
    [] rofi-avdman
    [] rofi-bookmarks
    [] rofi-cheatsheet
    [] rofi-clipboard
    [] rofi-droid-deps
    [] rofi-droid-perms
    [] rofi-launcher
    [] rofi-mpd
    [] rofi-note
    [] rofi-powermenu
    [] rofi-virtmanager
    [] vmsfolder
    [x] install
    [x] uninstall
